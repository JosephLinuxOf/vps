#!/bin/bash
#

not_root() {
    echo "ERROR: You have to be root to execute this script"
    exit 1
}

zram_exists() {
    echo "ERROR: /etc/init.d/zram already exists"
    exit 1
}

# Check if user is root
[ $EUID != 0 ] && not_root

# Check if zram file already exists
[ -f /etc/init.d/zram ] && zram_exists



cat >/etc/init.d/zram <<EOL
#!/bin/bash
### BEGIN INIT INFO
# Provides:          zram
# Required-Start:    $local_fs
# Required-Stop:     $local_fs
# Default-Start:     S
# Default-Stop:      0 1 6
# Short-Description: Use compressed RAM as in-memory swap
# Description:       Use compressed RAM as in-memory swap
### END INIT INFO
# Author: Antonio Galea <antonio.galea@gmail.com>
# Thanks to Przemysław Tomczyk for suggesting swapoff parallelization
FRACTION=75
MEMORY=\`perl -ne'/^MemTotal:\s+(\d+)/ && print \$1*1024;' < /proc/meminfo\`
CPUS=\`grep -c processor /proc/cpuinfo\`
SIZE=\$(( MEMORY * FRACTION / 100 / CPUS ))
case "\$1" in
  "start")
    param=\`modinfo zram|grep num_devices|cut -f2 -d:|tr -d ' '\`
    modprobe zram \$param=\$CPUS
    for n in \`seq \$CPUS\`; do
      i=\$((n - 1))
      echo \$SIZE > /sys/block/zram\$i/disksize
      mkswap /dev/zram\$i
      swapon /dev/zram\$i -p 10
    done
    ;;
  "stop")
    for n in \`seq \$CPUS\`; do
      i=$((n - 1))
      swapoff /dev/zram\$i && echo "disabled disk \$n of \$CPUS" &
    done
    wait
    sleep .5
    modprobe -r zram
    ;;
  *)
    echo "Usage: \`basename \$0\` (start | stop)"
    exit 1
    ;;
esac
EOL

chmod +x /etc/init.d/zram

insserv zram

/etc/init.d/zram start

exit 0

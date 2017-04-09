# Installing PPA repositories on Debian-based distributions
# Created by Joe Linux
# If you are using Kali Linux, change from http to repo, as below:
# deb http://repo.kali.org/kali kali-rolling main contrib non-free
# Only if the installation take


DIR=/usr/bin/
FILE=add-apt-repository

if [ -e "$DIR$FILE" ] ; then
	echo "add-apt-repository already installed! exiting..."
	exit 0
else
	echo "Installation started..."
fi


	apt-get update 1>/dev/null

	apt-get install -y python-software-properties apt-file 1>/dev/null 2>/dev/null

	apt-file update 1>/dev/null

	wget https://raw.githubusercontent.com/JosephLinuxOf/vps/master/$FILE 1>/dev/null

	mv $FILE $DIR

	chmod o+x $DIR$FILE

	chown root:root $DIR$FILE


release=$(grep -w trusty /etc/lsb-release | wc -l)

	if [ "$release" -ge "1" ] ; then
		echo "Release for Ubuntu 14.04 already installed :)"
	exit 0
else
	echo "" >> /etc/lsb-release 
	echo "DISTRIB_ID=Ubuntu" >> /etc/lsb-release  
	echo "DISTRIB_RELEASE=14.04" >> /etc/lsb-release 
	echo "DISTRIB _CODENAME=trusty" >> /etc/lsb-release 
	echo "DISTRIB_DESCRIPTION=Ubuntu 14.04" >> /etc/lsb-release
fi
	clear
	echo "add-apt-repository installed :)"

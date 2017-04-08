ubuntu16 () {
	
	apt-get update
	apt-get install -y squid curl nano sysv-rc-conf ulatency ulatencyd
	
	cd /etc/ssh/

	echo "$(sed 's/22/443/g' sshd_config)" > sshd_config
	echo "" >> sshd_config	
	echo "Port 22" >> sshd_config	
	
	ip=$(wget -qO - icanhazip.com)
	
	echo "# PORTAS DE ACESSO NO SQUID" > /etc/squid/squid.conf
	echo "http_port 80" >> /etc/squid/squid.conf
	echo "http_port 8080" >> /etc/squid/squid.conf
	echo "http_port 8799" >> /etc/squid/squid.conf
	echo "http_port 3128" >> /etc/squid/squid.conf
	echo "" >> /etc/squid/squid.conf
	echo "" >> /etc/squid/squid.conf
	echo "# NOME DO SERVIDOR" >> /etc/squid/squid.conf
	echo "visible_hostname JoeLinux" >> /etc/squid/squid.conf
	echo "" >> /etc/squid/squid.conf
	echo "" >> /etc/squid/squid.conf
	echo "# ACL DE CONEXAO" >> /etc/squid/squid.conf
	echo "acl accept src $ip" >> /etc/squid/squid.conf
	echo "acl ip url_regex -i $ip" >> /etc/squid/squid.conf
	echo "" >> /etc/squid/squid.conf
	echo "" >> /etc/squid/squid.conf
	echo "# CACHE DO SQUID" >> /etc/squid/squid.conf
	echo "cache_mem 200 MB" >> /etc/squid/squid.conf
	echo "maximum_object_size_in_memory 32 KB" >> /etc/squid/squid.conf
	echo "maximum_object_size 1024 MB" >> /etc/squid/squid.conf
	echo "minimum_object_size 0 KB" >> /etc/squid/squid.conf
	echo "cache_swap_low 90" >> /etc/squid/squid.conf
	echo "cache_swap_high 95" >> /etc/squid/squid.conf
	echo "cache_dir ufs /var/spool/squid 100 16 256" >> /etc/squid/squid.conf
	echo "access_log /var/log/squid/access.log squid" >> /etc/squid/squid.conf
	echo "" >> /etc/squid/squid.conf
	echo "" >> /etc/squid/squid.conf
	echo "# ACESSOS ACL" >> /etc/squid/squid.conf
	echo "http_access allow accept" >> /etc/squid/squid.conf
	echo "http_access allow ip" >> /etc/squid/squid.conf
	echo "http_access deny all" >> /etc/squid/squid.conf
	echo "cache deny all" >> /etc/squid/squid.conf

	sysv-rc-conf squid on

	service squid restart

	service ssh restart
	
	clear
	echo "Servidor/Proxy"
	echo "$ip"
	echo "Porta: 80, 8080, 8799 e 3128"
	echo "Porta SSH: 443"


}


ubuntu () {
	
	apt-get update
	apt-get install -y squid3 curl nano sysv-rc-conf ulatency ulatencyd
	
	cd /etc/ssh/

	echo "$(sed 's/22/443/g' sshd_config)" > sshd_config
	echo "" >> sshd_config	
	echo "Port 22" >> sshd_config		
	
	ip=$(wget -qO - icanhazip.com)
	
	echo "# PORTAS DE ACESSO NO SQUID" > /etc/squid3/squid.conf
	echo "http_port 80" >> /etc/squid3/squid.conf
	echo "http_port 8080" >> /etc/squid3/squid.conf
	echo "http_port 8799" >> /etc/squid3/squid.conf
	echo "http_port 3128" >> /etc/squid3/squid.conf
	echo "" >> /etc/squid3/squid.conf
	echo "" >> /etc/squid3/squid.conf
	echo "# NOME DO SERVIDOR" >> /etc/squid3/squid.conf
	echo "visible_hostname JoeLinux" >> /etc/squid3/squid.conf
	echo "" >> /etc/squid3/squid.conf
	echo "" >> /etc/squid3/squid.conf
	echo "# ACL DE CONEXAO" >> /etc/squid3/squid.conf
	echo "acl accept src $ip" >> /etc/squid3/squid.conf
	echo "acl ip url_regex -i $ip" >> /etc/squid3/squid.conf
	echo "" >> /etc/squid3/squid.conf
	echo "" >> /etc/squid3/squid.conf
	echo "# CACHE DO SQUID" >> /etc/squid3/squid.conf
	echo "cache_mem 200 MB" >> /etc/squid3/squid.conf
	echo "maximum_object_size_in_memory 32 KB" >> /etc/squid3/squid.conf
	echo "maximum_object_size 1024 MB" >> /etc/squid3/squid.conf
	echo "minimum_object_size 0 KB" >> /etc/squid3/squid.conf
	echo "cache_swap_low 90" >> /etc/squid3/squid.conf
	echo "cache_swap_high 95" >> /etc/squid3/squid.conf
	echo "cache_dir ufs /var/spool/squid3 30 16 256" >> /etc/squid3/squid.conf
	echo "access_log /var/log/squid3/access.log squid" >> /etc/squid3/squid.conf
	echo "cache_log /var/log/squid3/cache.log" >> /etc/squid3/squid.conf
	echo "cache_store_log /var/log/squid3/store.log" >> /etc/squid3/squid.conf
	echo "pid_filename /var/log/squid3/squid3.pid" >> /etc/squid3/squid.conf
	echo "mime_table /usr/share/squid3/mime.conf" >> /etc/squid3/squid.conf
	echo "" >> /etc/squid3/squid.conf
	echo "" >> /etc/squid3/squid.conf
	echo "# ACESSOS ACL" >> /etc/squid3/squid.conf
	echo "http_access allow accept" >> /etc/squid3/squid.conf
	echo "http_access allow ip" >> /etc/squid3/squid.conf
	echo "http_access deny all" >> /etc/squid3/squid.conf
	echo "cache deny all" >> /etc/squid3/squid.conf

	sysv-rc-conf squid3 on

	service squid3 restart

	service ssh restart
	
	clear
	echo "Servidor/Proxy"
	echo "$ip"
	echo "Porta: 80, 8080, 8799 e 3128"
	echo "Porta SSH: 443"


}

debian () {
	
	apt-get update
	apt-get install -y squid3 curl nano sysv-rc-conf ulatency ulatencyd
	
	cd /etc/ssh/

	echo "$(sed 's/22/443/g' sshd_config)" > sshd_config
	echo "" >> sshd_config	
	echo "Port 22" >> sshd_config		
	
	ip=$(wget -qO - icanhazip.com)
	
	echo "# PORTAS DE ACESSO NO SQUID" > /etc/squid3/squid.conf
	echo "http_port 80" >> /etc/squid3/squid.conf
	echo "http_port 8080" >> /etc/squid3/squid.conf
	echo "http_port 8799" >> /etc/squid3/squid.conf
	echo "http_port 3128" >> /etc/squid3/squid.conf
	echo "" >> /etc/squid3/squid.conf
	echo "" >> /etc/squid3/squid.conf
	echo "# NOME DO SERVIDOR" >> /etc/squid3/squid.conf
	echo "visible_hostname JoeLinux" >> /etc/squid3/squid.conf
	echo "" >> /etc/squid3/squid.conf
	echo "" >> /etc/squid3/squid.conf
	echo "# ACL DE CONEXAO" >> /etc/squid3/squid.conf
	echo "acl accept src $ip" >> /etc/squid3/squid.conf
	echo "acl ip url_regex -i $ip" >> /etc/squid3/squid.conf
	echo "" >> /etc/squid3/squid.conf
	echo "" >> /etc/squid3/squid.conf
	echo "# CACHE DO SQUID" >> /etc/squid3/squid.conf
	echo "cache_mem 200 MB" >> /etc/squid3/squid.conf
	echo "maximum_object_size_in_memory 32 KB" >> /etc/squid3/squid.conf
	echo "maximum_object_size 1024 MB" >> /etc/squid3/squid.conf
	echo "minimum_object_size 0 KB" >> /etc/squid3/squid.conf
	echo "cache_swap_low 90" >> /etc/squid3/squid.conf
	echo "cache_swap_high 95" >> /etc/squid3/squid.conf
	echo "cache_dir ufs /var/spool/squid3 30 16 256" >> /etc/squid3/squid.conf
	echo "access_log /var/log/squid3/access.log squid" >> /etc/squid3/squid.conf
	echo "cache_log /var/log/squid3/cache.log" >> /etc/squid3/squid.conf
	echo "cache_store_log /var/log/squid3/store.log" >> /etc/squid3/squid.conf
	echo "pid_filename /var/log/squid3/squid3.pid" >> /etc/squid3/squid.conf
	echo "mime_table /usr/share/squid3/mime.conf" >> /etc/squid3/squid.conf
	echo "" >> /etc/squid3/squid.conf
	echo "" >> /etc/squid3/squid.conf
	echo "# ACESSOS ACL" >> /etc/squid3/squid.conf
	echo "http_access allow accept" >> /etc/squid3/squid.conf
	echo "http_access allow ip" >> /etc/squid3/squid.conf
	echo "http_access deny all" >> /etc/squid3/squid.conf
	echo "cache deny all" >> /etc/squid3/squid.conf

	sysv-rc-conf squid3 on

	service squid3 restart

	service ssh restart
	
	clear
	echo "Servidor/Proxy"
	echo "$ip"
	echo "Porta: 80, 8080, 8799 e 3128"
	echo "Porta SSH: 443"
	
}

	if cat /etc/issue | grep "Debian" 1>/dev/null 2>/dev/null; then  
	
	debian
	
	elif cat /etc/issue | grep "Ubuntu 16" 1>/dev/null 2>/dev/null; then  
	
	ubuntu16
	
	elif cat /etc/issue | grep "Ubuntu" 1>/dev/null 2>/dev/null; then  
	
	ubuntu
	
	else
	echo "Sistema não compatível, saindo..."
	exit
fi

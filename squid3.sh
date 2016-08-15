
#installing squid3
apt-get install squid3 -y
rm -f /etc/squid3/squid.conf
#restoring squid config with open port proxy 80 & 8080 & 60000
wget -P /etc/squid3/ "https://gist.githubusercontent.com/hpcorona/5065634/raw/677d77ac1ea425793bbb1a901502cd01eb2942c5/squid.conf"
sed -i "s/ipserver/$IP/g" /etc/squid3/squid.conf
service squid3 restart

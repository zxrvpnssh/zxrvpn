
#adding source list
echo "http://repo.mongodb.org/apt/debian wheezy/mongodb-org/3.0 main" > /etc/apt/sources.list.d/mongodb-org-3.0.list
echo "http://repo.pritunl.com/stable/apt jessie main" > /etc/apt/sources.list.d/pritunl.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7F0CEB10
apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv CF8E292A
apt-get update
apt-get install pritunl mongodb-org -y
systemctl start mongod pritunl
#installing squid3
apt-get install squid3 -y
rm -f /etc/squid3/squid.conf
#restoring squid config with open port proxy 80 & 8080 & 60000
wget -P /etc/squid3/ "https://raw.githubusercontent.com/a8401011452/shscript/master/script/squid.conf"
sed -i "s/ipserver/$IP/g" /etc/squid3/squid.conf
service squid3 restart
cd /root

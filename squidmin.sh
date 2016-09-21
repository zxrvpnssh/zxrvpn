#installing squid3
aptitude -y install squid3
rm -f /etc/squid3/squid.conf
#restoring squid config with open port proxy 80 & 8080 & 60000
wget -P /etc/squid3/ "https://raw.githubusercontent.com/a8401011452/shscript/master/script/squid.conf"
sed -i "s/ipserver/$IP/g" /etc/squid3/squid.conf
service squid3 restart
cd /root
#installing webmin
wget http://www.webmin.com/jcameron-key.asc
apt-key add jcameron-key.asc
echo "deb http://download.webmin.com/download/repository sarge contrib" >> /etc/apt/sources.list
echo "deb http://webmin.mirror.somersettechsolutions.co.uk/repository sarge contrib" >> /etc/apt/sources.list
apt-get update
apt-get -y install webmin
#disable webmin https
sed -i "s/ssl=1/ssl=0/g" /etc/webmin/miniserv.conf
/etc/init.d/webmin restart
service openvpn-nl restart
cd
rm squidmin.sh

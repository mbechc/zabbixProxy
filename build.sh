docker image prune -af
rm /opt/zabbixProxy/*.tar
docker build -t zabbix-proxy-arm64:3.18-5.0.46 .
docker save zabbix-proxy-arm64:3.18-5.0.46 -o zabbix-proxy-arm64.tar
ioxclient package zabbix-proxy-arm64.tar /opt/zabbixProxy/binaries
rm -fr 2025*

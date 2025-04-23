#!/bin/sh

# Render the config using envsubst
echo "[entrypoint] Using ZBX_PROXY_HOSTNAME=${ZBX_PROXY_HOSTNAME}"
envsubst < /opt/zabbix/etc/zabbix_proxy.conf.template > /opt/zabbix/etc/zabbix_proxy.conf

# Run Zabbix Proxy
exec /opt/zabbix/sbin/zabbix_proxy -f -c /opt/zabbix/etc/zabbix_proxy.conf

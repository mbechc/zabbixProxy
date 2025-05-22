ioxclient app stop zabbixProxy
ioxclient app deactivate zabbixProxy
ioxclient app uninstall zabbixProxy
ioxclient application install zabbixProxy package.tar
ioxclient application activate zabbixProxy --payload activation.json
ioxclient application setconfig zabbixProxy zabbixProxy-package_config.ini
ioxclient application start zabbixProxy
ioxclient application status zabbixProxy

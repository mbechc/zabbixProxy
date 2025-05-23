# zabbixProxy
This Repository aims to be a starting point for those who wants to run Zabbix Proxy on Cisco IE3400 IOx container.
What is Zabbix? Please visit https://www.zabbix.dk

## Build new Zabbix Proxy for Cisco IE3400 
requires ARM64 platform or knowledge on how to cross-compile. I have done all compile on MacBook M-series.
Use build.sh for necessary build commands, this should only be necessary if Zabbix Proxy needs support for more Zabbix Features.  

## Install Zabbix Proxy onto IE3400
Use install.sh for necessary commands. Before Install, please edit zabbixProxy-package_config.ini for changes to zabbix_proxy.conf

## ioxclient
install.sh uses ioxclient to install and configure the application onto IE3400 IOx. Latest ioxclient can be downloaded from Cisco Devnet
https://developer.cisco.com/docs/iox/iox-resource-downloads/


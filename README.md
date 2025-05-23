# zabbixProxy
This Repository aims to be a starting point for those who wants to run Zabbix Proxy on [Cisco IE3400](https://www.cisco.com/c/en/us/products/switches/industrial-ethernet-switches/catalyst-IE3000-rugged-switches.html?dtid=odicdc000509) IOx container.
What is Zabbix? Please visit https://www.zabbix.dk

## Quick Launch
You don't have to build or use CLI to install and run a Zabbix Proxy on the Switch, try the [manual install](binaries/README.md) and pre-built image. Zabbix Proxy is built with the parameters found in Dockerfile.



## Build new Zabbix Proxy for Cisco IE3400 
requires ARM64 platform or knowledge on how to cross-compile. I have done all compile on MacBook M-series.
Use build.sh for necessary build commands, this should only be necessary if Zabbix Proxy needs support for more Zabbix Features.  

## Install Zabbix Proxy onto IE3400
Use install.sh for necessary commands. Before Install, please edit zabbixProxy-package_config.ini for changes to zabbix_proxy.conf

## Prerequisites
### ioxclient
install.sh uses ioxclient to install and configure the application onto IE3400 IOx. Latest ioxclient can be downloaded from Cisco Devnet
https://developer.cisco.com/docs/iox/iox-resource-downloads/
### Switch Config
IOx needs to be activated in the switch and http server has to be enabled for ioxclient to be able to install IOx containers.
```
conf t
ip http server
ip http secure-server
iox
no app-hosting signed-verification
restconf
do write
```


# Manual install of package.tar using IE3400 GUI
## Prepare Switch

```
conf t
ip http server
ip http secure-server
iox
no app-hosting signed-verification
restconf
do write
```

## Launch Switch IOX GUI

Open https://<SWITCHIP>/webui/#/ioxmain

**Add New**

<img width="696" alt="image" src="https://github.com/user-attachments/assets/65334cf4-7111-4b9a-9b98-9f3fde8f3633" />

**Deploy package.tar**

<img width="363" alt="image" src="https://github.com/user-attachments/assets/f94d4eea-6517-46b3-8cd6-bdc1d1472f31" />

## Activate Application - configure Application networking

Click Activate and Press "Add App Network Interface

<img width="548" alt="image" src="https://github.com/user-attachments/assets/bc53d2f3-2233-4e99-b173-26bc5d9a2411" />

Press OK - and Click "Interface Setting"

<img width="484" alt="image" src="https://github.com/user-attachments/assets/fe10e1c6-9912-4029-bc9c-964ddb6d1621" />

Click Add - Then press "Activate App"

## Modify zabbix_proxy.conf and insert into App-Config

The container will read App-Config at start and convert it into /etc/zabbix/zabbix_proxy.conf, then start Zabbix Proxy
Click the tab "App-Config" - Fill in the zabbix_proxy.conf - please include the header and footer
```
@@@FILE:/etc/zabbix/zabbix_proxy.conf
ProxyMode=0
Server=193.47.71.165
ServerPort=10051
Hostname=cias0010
LogType=console
DBName=/var/lib/zabbix/zabbix_proxy
ProxyOfflineBuffer=3
HeartbeatFrequency=10
AllowRoot=1
ConfigFrequency=180
StartTrappers=0
StartPingers=10
Timeout=4
FpingLocation=/usr/sbin/fping
LogSlowQueries=3000
AllowRoot=1
StatsAllowedIP=127.0.0.1
@@@END
```





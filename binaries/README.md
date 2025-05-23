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

<img width="696" alt="image" src="https://github.com/user-attachments/assets/65334cf4-7111-4b9a-9b98-9f3fde8f3633" />





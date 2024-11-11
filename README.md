# Backup_Jellyfin_ftp
 Backup from Jellyfin server


 # USE

 Prérequis :
 lftp on Jellyfin server

just modify .env
```
FTP_SERVER="IP or DOMAIN"
PORT="1234"
FTP_USER="USERNAME"
FTP_PASSWORD="PASSWORD"
REMOTE_DIR="/Jellyfin" 
BACKUP_DIR="/tmp/jellyfin_backup" 
```
 
Launch Backup_Jellyfin.sh simply
```
bash Backup_Jellyfin.sh
```

Launch with crontab
```
0 2 * * * /path/to/Backup_Jellyfin.sh # for exemple every day at 2am
```

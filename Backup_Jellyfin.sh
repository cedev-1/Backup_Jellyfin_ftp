#!/bin/bash

# .env
set -o allexport
source .env
set +o allexport

BACKUP_DATE=$(date +"%Y-%m-%d")
ARCHIVE_NAME="jellyfin_backup_$BACKUP_DATE.tar.gz"

mkdir -p "$BACKUP_DIR"

cp -r /var/lib/jellyfin "$BACKUP_DIR"
cp -r /etc/jellyfin "$BACKUP_DIR"

tar -czf "/tmp/$ARCHIVE_NAME" -C "$BACKUP_DIR" .

lftp -u "$FTP_USER","$FTP_PASSWORD" -p "$PORT" "$FTP_SERVER" <<EOF # port FTP
cd $REMOTE_DIR
put "/tmp/$ARCHIVE_NAME"
bye
EOF

rm -rf "$BACKUP_DIR"
rm "/tmp/$ARCHIVE_NAME"

echo "Backup OK : $BACKUP_DATE"
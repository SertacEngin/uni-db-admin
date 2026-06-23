#!/bin/bash

BACKUP_DIR="$(dirname "$0")/../backup"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
FILENAME="university_${TIMESTAMP}.dump"
LOGFILE="$BACKUP_DIR/backup.log"

mkdir -p "$BACKUP_DIR"

echo "[$(date)] Starting backup..." >> "$LOGFILE"

docker exec uni-postgres \
pg_dump -U admin -d university -Fc \
> "$BACKUP_DIR/$FILENAME"

if [ $? -eq 0 ]; then
    echo "[$(date)] Backup successful: $FILENAME" >> "$LOGFILE"
else
    echo "[$(date)] Backup FAILED" >> "$LOGFILE"
fi

# Delete backups older than 7 days
find "$BACKUP_DIR" -name "university_*.dump" -mtime +7 -delete

echo "[$(date)] Cleanup completed" >> "$LOGFILE"

echo "DB size check:"
docker exec uni-postgres psql -U admin -d university -c "SELECT pg_size_pretty(pg_database_size('university'));"

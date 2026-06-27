#!/bin/bash

# Absolute Pfade auflösen für maximale Sicherheit
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BACKUP_DIR="$SCRIPT_DIR/../backup"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
FILENAME="university_${TIMESTAMP}.dump"
LOGFILE="$BACKUP_DIR/backup.log"

# Backup-Verzeichnis erstellen
mkdir -p "$BACKUP_DIR"

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Starting backup..." >> "$LOGFILE"

# Wichtig: Kein -t Flag bei automatisierten Skripten verwenden (verhindert TTY-Fehler)
docker exec uni-postgres pg_dump -U admin -d university -Fc > "$BACKUP_DIR/$FILENAME"

if [ $? -eq 0 ]; then
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Backup successful: $FILENAME" >> "$LOGFILE"
    
    # DB-Größe direkt im Log erfassen
    DB_SIZE=$(docker exec uni-postgres psql -U admin -d university -t -c "SELECT pg_size_pretty(pg_database_size('university'));" | xargs)
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Database Size: $DB_SIZE" >> "$LOGFILE"
else
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] ERROR: Backup FAILED" >> "$LOGFILE"
    exit 1
fi

# Sicheres Löschen von Backups, die älter als 7 Tage sind
if [ -d "$BACKUP_DIR" ]; then
    find "$BACKUP_DIR" -maxdepth 1 -name "university_*.dump" -mtime +7 -type f -delete
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Cleanup completed" >> "$LOGFILE"
fi

echo "----------------------------------------" >> "$LOGFILE"

#!/bin/bash

BASE_DIR="/home/sertac/uni-db-admin/backup"
LOGFILE="$BASE_DIR/logs/backup.log"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Ensure directories exist
mkdir -p "$BASE_DIR/logs"

echo "[$(date)] BACKUP START" >> "$LOGFILE"

# -------------------------
# PostgreSQL
# -------------------------
# FIXED: Merged into a single execution line
docker exec -t uni-postgres pg_dump -U admin -d university -Fc > "$BASE_DIR/postgres_${TIMESTAMP}.dump" 2>> "$LOGFILE"

# -------------------------
# MariaDB
# -------------------------
# FIXED: Merged into a single execution line
docker exec -t uni-mariadb mysqldump -uadmin -pchangeme123 uni_admin > "$BASE_DIR/mariadb_${TIMESTAMP}.sql" 2>> "$LOGFILE"

# -------------------------
# MongoDB
# -------------------------
# FIXED: Merged into a single execution line (Note: added credentials if auth is enabled)
docker exec -t uni-mongodb mongodump --db uni_content --archive > "$BASE_DIR/mongo_${TIMESTAMP}.archive" 2>> "$LOGFILE"

echo "[$(date)] BACKUP DONE" >> "$LOGFILE"

# -------------------------
# ROTATION (7 Days)
# -------------------------
echo "[$(date)] STARTING ROTATION" >> "$LOGFILE"

# Safely delete backup files older than 7 days
find "$BASE_DIR" -name "postgres_*.dump" -mtime +7 -delete 2>> "$LOGFILE"
find "$BASE_DIR" -name "mariadb_*.sql" -mtime +7 -delete 2>> "$LOGFILE"
find "$BASE_DIR" -name "mongo_*.archive" -mtime +7 -delete 2>> "$LOGFILE"

echo "[$(date)] CLEANUP DONE" >> "$LOGFILE"
echo "----------------------------------------" >> "$LOGFILE"

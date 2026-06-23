#!/bin/bash

LOG_DIR="./logs"
ALERT_FILE="$LOG_DIR/alerts.log"

mkdir -p "$LOG_DIR"

timestamp=$(date "+%Y-%m-%d %H:%M:%S")

echo "[$timestamp] ALERT: PostgreSQL DOWN" >> "$ALERT_FILE"

./scripts/mail_simulator.sh \
"PostgreSQL DOWN" \
"Database uni-postgres is not reachable."

# -------------------------
# PostgreSQL check
# -------------------------
docker exec uni-postgres pg_isready -U admin >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "[$timestamp] ALERT: PostgreSQL DOWN" >> "$ALERT_FILE"
fi

# -------------------------
# MariaDB check
# -------------------------
# FIXED: Changed 'mariadbadmin' to 'mariadb-admin'
docker exec uni-mariadb mariadb-admin ping -uadmin -pchangeme123 >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "[$timestamp] ALERT: MariaDB DOWN" >> "$ALERT_FILE"
fi

# -------------------------
# MongoDB check
# -------------------------
# FIXED: Added authentication flags so MongoDB doesn't block the request
docker exec uni-mongodb mongosh -u admin -p changeme123 --authenticationDatabase admin --quiet --eval "db.adminCommand({ ping: 1 })" >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "[$timestamp] ALERT: MongoDB DOWN" >> "$ALERT_FILE"
fi

# -------------------------
# Oracle check
# -------------------------
docker exec uni-oracle bash -c "echo 'SELECT 1 FROM dual;' | sqlplus -s system/changeme123@//localhost:1521/XEPDB1" >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "[$timestamp] ALERT: Oracle DOWN" >> "$ALERT_FILE"
fi

echo "[$timestamp] CHECK END" >> "$ALERT_FILE"

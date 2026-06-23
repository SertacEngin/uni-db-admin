#!/bin/bash

clear

echo "======================================"
echo "   UNIVERSITY MULTI-DB DASHBOARD v2"
echo "======================================"
echo ""

# -------------------------
# Docker Status
# -------------------------
echo "[SYSTEM - Containers]"
docker ps --format "table {{.Names}}\t{{.Status}}"
echo ""

# -------------------------
# PostgreSQL
# -------------------------
# xargs trimmt unschöne Leerzeichen aus der Ausgabe
PG_COUNT=$(docker exec uni-postgres psql -U admin -d university -t -c "SELECT COUNT(*) FROM students;" 2>/dev/null | xargs)

if [ $? -eq 0 ] && [ -n "$PG_COUNT" ]; then
    echo "PostgreSQL:   ✅ OK - Students: $PG_COUNT"
else
    echo "PostgreSQL:   ❌ DOWN"
fi

# -------------------------
# MariaDB
# -------------------------
# REPARIERT: Befehl vollständig geschlossen und Datenbank korrigiert
MDB_COUNT=$(docker exec uni-mariadb mariadb -uadmin -pchangeme123 -N -e "SELECT COUNT(*) FROM uni_admin.staff;" 2>/dev/null | xargs)

if [ $? -eq 0 ] && [ -n "$MDB_COUNT" ]; then
    echo "MariaDB:      ✅ OK - Staff: $MDB_COUNT"
else
    echo "MariaDB:      ❌ DOWN"
fi

# -------------------------
# MongoDB
# -------------------------
# We run the command and hide the text output. We only check if it executes with success code 0.
docker exec uni-mongodb mongosh -u admin -p changeme123 --authenticationDatabase admin --quiet --eval "db.adminCommand({ping: 1})" >/dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "MongoDB:      ✅ OK"
else
    echo "MongoDB:      ❌ DOWN"
fi

# -------------------------
# Oracle
# -------------------------
# REPARIERT: Verbindungsstring korrigiert und Test auf erfolgreiche Ausführung umgestellt
ORACLE_TEST=$(docker exec uni-oracle bash -c "echo 'SELECT 1 FROM dual;' | sqlplus -s system/changeme123@//localhost:1521/XE" 2>/dev/null)

# Wir prüfen per grep, ob die '1' irgendwo in der Ausgabe existiert, um Formatierungsfehler zu umgehen
if echo "$ORACLE_TEST" | grep -q "1"; then
    echo "Oracle:       ✅ OK"
else
    echo "Oracle:       ❌ DOWN"
fi

echo ""
echo "======================================"
echo "STATUS CHECK COMPLETE"
echo "======================================"

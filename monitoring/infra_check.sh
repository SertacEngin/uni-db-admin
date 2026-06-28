#!/bin/bash

# Farben für die Ausgabe definieren (wirkt in der Demo extrem professionell)
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color
BOLD='\033[1m'

# 1. .env Datei laden, um Passwörter und User dynamisch zu nutzen
ENV_FILE="$(dirname "$0")/../.env"
if [ -f "$ENV_FILE" ]; then
    export $(cat "$ENV_FILE" | grep -v '^#' | xargs)
else
    echo -e "${RED}[ERROR] .env Datei wurde nicht gefunden!${NC}"
    # Fallback-Passwörter, falls .env im Interview mal zickt:
    MARIADB_PASSWORD=${MARIADB_PASSWORD:-"changeme123"}
    ORACLE_PASSWORD=${ORACLE_PASSWORD:-"changeme123"}
fi

echo -e "${BOLD}=========================================="
echo "    UNIVERSITY INFRASTRUCTURE HEALTH CHECK"
echo -e "==========================================${NC}"

# 2. Docker Container Status
echo -e "\n${BOLD}[1] Docker Containers Status:${NC}"
docker ps --format "table {{.Names}}\t{{.Status}}"

# Function für eine standardisierte DB-Erreichbarkeitsprüfung
check_status() {
    if [ $1 -eq 0 ]; then
        echo -e "Status: ${GREEN}🟢 HEALTHY (Query successful)${NC}"
    else
        echo -e "Status: ${RED}🔴 CRITICAL (Connection failed)${NC}"
    fi
}

# 3. PostgreSQL Check
echo -e "\n${BOLD}[2] PostgreSQL Check:${NC}"
PG_OUT=$(docker exec uni-postgres psql -U admin -d university -t -c "SELECT COUNT(*) FROM students;" 2>/dev/null)
check_status $?
if [ $? -eq 0 ]; then echo "Students Count: $(echo $PG_OUT | xargs)"; fi

# 4. MariaDB Check
echo -e "\n${BOLD}[3] MariaDB Check:${NC}"
docker exec uni-mariadb mariadb -uadmin -p"${MARIADB_PASSWORD}" -e "USE uni_admin; SHOW TABLES;" >/dev/null 2>&1
check_status $?

# 5. MongoDB Check (Sicher ohne Hardcoding)
echo -e "\n${BOLD}[4] MongoDB Check:${NC}"

# Hier rufen wir direkt die Variablen auf, die durch das Einlesen der .env bereitstehen
MONGO_OUT=$(docker exec uni-mongodb mongosh -u "$MONGO_INITDB_ROOT_USERNAME" -p "$MONGO_INITDB_ROOT_PASSWORD" --authenticationDatabase admin --quiet --eval "db = db.getSiblingDB('uni_content'); db.students_feedback.countDocuments();" 2>/dev/null)
check_status $?

if [ $? -eq 0 ] && [ ! -z "$MONGO_OUT" ]; then 
    echo "Feedbacks Count: $(echo $MONGO_OUT | xargs)"
fi

# 6. Oracle Check
echo -e "\n${BOLD}[5] Oracle Check:${NC}"
# Hier nutzen wir das sys-Passwort oder das system-Passwort aus der Umgebung
docker exec uni-oracle bash -c "echo 'SELECT 1 FROM DUAL;' | sqlplus -s system/${ORACLE_PASSWORD}@//localhost:1521/XEPDB1" >/dev/null 2>&1
check_status $?

echo -e "\n${BOLD}=========================================="
echo "CHECK COMPLETE"
echo -e "==========================================${NC}"

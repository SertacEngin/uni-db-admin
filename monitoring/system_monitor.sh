#!/bin/bash

echo "=============================="
echo "   UNIVERSITY SYSTEM STATUS"
echo "=============================="

echo ""
echo "[1] Docker Containers"
docker ps --format "table {{.Names}}\t{{.Status}}"

echo ""
echo "[2] PostgreSQL Check"
docker exec uni-postgres psql -U admin -d university -c "SELECT COUNT(*) FROM students;" 2>/dev/null

echo ""
echo "[3] MariaDB Check"
docker exec uni-mariadb mariadb -uadmin -pchangeme123 -e "USE uni_admin; SHOW TABLES;" 2>/dev/null

echo ""
echo "[4] MongoDB Check"
docker exec uni-mongodb mongosh --quiet --eval "db = db.getSiblingDB('uni_content'); db.students_feedback.countDocuments();" 2>/dev/null

echo ""
echo "[5] Oracle Check"
docker exec uni-oracle bash -c "echo 'SELECT COUNT(*) FROM uni_admin.reports;' | sqlplus -s system/changeme123@//localhost:1521/XEPDB1" 2>/dev/null

echo ""
echo "=============================="
echo "CHECK COMPLETE"
echo "=============================="

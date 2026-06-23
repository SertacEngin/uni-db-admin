#!/bin/bash

echo "=========================="
echo " UNIVERSITY SYSTEM STATUS"
echo "=========================="

echo ""
echo "[Docker Containers]"
docker ps --format "table {{.Names}}\t{{.Status}}"

echo ""
echo "[Volumes]"
docker volume ls

echo ""
echo "[PostgreSQL]"
docker exec uni-postgres psql -U admin -d university -c "SELECT COUNT(*) FROM students;" 2>/dev/null

echo ""
echo "[MariaDB]"
docker exec uni-mariadb mariadb -uadmin -pchangeme123 -e "USE uni_admin; SHOW TABLES;" 2>/dev/null

echo ""
echo "=========================="
echo "CHECK COMPLETE"
echo "=========================="

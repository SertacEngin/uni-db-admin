#!/bin/bash

echo "=== UNIVERSITY DB HEALTH CHECK ==="

echo ""
echo "[1] Container Status:"
docker ps --filter name=uni-postgres

echo ""
echo "[2] Database Connection Test:"
docker exec uni-postgres psql -U admin -d university -c "SELECT 1;" >/dev/null 2>&1

if [ $? -eq 0 ]; then
echo "PostgreSQL: OK"
else
echo "PostgreSQL: FAILED"
fi

echo ""
echo "[3] Table Counts:"
docker exec uni-postgres psql -U admin -d university -c "
SELECT 'students' AS table, COUNT(*) FROM students
UNION ALL
SELECT 'courses', COUNT(*) FROM courses
UNION ALL
SELECT 'enrollments', COUNT(*) FROM enrollments;
"

echo ""
echo "[4] Disk Usage (Docker volume):"
docker system df

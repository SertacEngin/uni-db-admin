#!/bin/bash

BACKUP_FILE=$1

if [ -z "$BACKUP_FILE" ]; then
    echo "Usage: restore.sh <backup-file>"
    exit 1
fi

cat "$BACKUP_FILE" | docker exec -i uni-postgres \
psql -U admin university

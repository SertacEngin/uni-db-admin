#!/bin/bash

ACTION=$1

case $ACTION in

start)
echo "Starting all services..."
docker compose up -d
;;

stop)
echo "Stopping all services..."
docker compose stop
;;

restart)
echo "Restarting all services..."
docker compose restart
;;

status)
./scripts/dashboard.sh
;;

backup)
echo "Running backups..."
./backup/scripts/full_backup.sh
;;

*)
echo "Usage: ./control.sh {start|stop|restart|status|backup}"
;;

esac

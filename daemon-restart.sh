#!/bin/bash
now="$(date)"
echo "now"

python manage.py daqdaemon start
(sleep 1 && python manage.py PyScadaDaemonHandler event stop)
(sleep 1 && python manage.py PyScadaDaemonHandler mail stop)
(sleep 1 && python manage.py PyScadaDaemonHandler export stop)

(sleep 1 && python manage.py PyScadaDaemonHandler event start)
(sleep 1 && python manage.py PyScadaDaemonHandler mail start)
(sleep 1 && python manage.py PyScadaDaemonHandler export start)

sleep 3600

while ["true"]
do
    python manage.py daqdaemon start
    (sleep 1 && python manage.py PyScadaDaemonHandler event stop)
    (sleep 1 && python manage.py PyScadaDaemonHandler mail stop)
    (sleep 1 && python manage.py PyScadaDaemonHandler export stop)

    (sleep 1 && python manage.py PyScadaDaemonHandler event start)
    (sleep 1 && python manage.py PyScadaDaemonHandler mail start)
    (sleep 1 && python manage.py PyScadaDaemonHandler export start)

    sleep 3600
done


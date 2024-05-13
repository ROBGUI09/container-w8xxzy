#/bin/bash

set -ex

gunicorn -w 4 -b '0.0.0.0:80' --access-logfile=- --debug 'app:app' &

exec /usr/sbin/smartdns -f -x 2>&1

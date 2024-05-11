#/bin/bash

set -ex

exec gunicorn -w 4 -b '0.0.0.0:5000' --access-logfile=- 'app:app'

exec /usr/sbin/smartdns -f -x 2>&1

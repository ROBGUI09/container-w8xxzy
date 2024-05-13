#/bin/bash

set -ex

#gunicorn -w 4 -b '0.0.0.0:5000' --debug --access-logfile=- 'app:app' &
python3 app.py &

exec /usr/sbin/smartdns -f -x 2>&1

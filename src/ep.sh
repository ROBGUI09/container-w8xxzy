#/bin/bash

set -ex

openssl genrsa -out smartdns-key.pem 2048
openssl req -x509 -sha256 -new -nodes -key smartdns-key.pem -days 3650 -out smartdns-cert.pem

#gunicorn -w 4 -b '0.0.0.0:5000' --debug --access-logfile=- 'app:app' &
python3 app.py &

exec /usr/sbin/smartdns -f -x 2>&1

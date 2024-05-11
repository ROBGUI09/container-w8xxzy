#!/bin/sh
set -ex

# Start gunicorn, listening on port 500, access log to stdout
exec docker run -d --name smartdns --restart=always -p 5000:5000/tcp -v /etc/smartdns:/etc/smartdns pymumu/smartdns:latest

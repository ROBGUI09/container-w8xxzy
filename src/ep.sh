#/bin/bash

set -ex

doh-httpproxy \
    --upstream-resolver=0.0.0.0 \
    --port 443 \
    --listen-address 0.0.0.0 &

exec /usr/sbin/smartdns -f -x 2>&1

#/bin/bash

set -ex

doh-httpproxy \
    --upstream-resolver=::1 \
    --port 443 \
    --listen-address ::1 &

exec /usr/sbin/smartdns -f -x 2>&1

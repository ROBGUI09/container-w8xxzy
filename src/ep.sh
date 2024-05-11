#/bin/bash

set -ex

/usr/sbin/doh-proxy -H 'container-w8xxzy.containers.anotherwebservice.com' -u 127.0.0.1:53 -g 0.0.0.0 -j 443 &

exec /usr/sbin/smartdns -f -x 2>&1

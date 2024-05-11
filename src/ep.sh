#/bin/bash

set -ex

exec /usr/sbin/smartdns -f -x 2>&1

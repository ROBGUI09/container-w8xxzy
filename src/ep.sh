#/bin/bash

set -ex

exec bash -c "/usr/sbin/smartdns -f -x 2>&1"

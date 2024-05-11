#/bin/sh

set -ex

exec ls /usr/sbin/smartdns
exec ls /usr/bin/smartdns
exec which smartdns

exec smartdns -f -x

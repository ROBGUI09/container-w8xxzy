# syntax=docker/dockerfile:1
FROM pymumu/smartdns:latest
#WORKDIR /etc/smartdns
RUN mkdir -p /etc/smartdns
COPY ./smartdns.conf /etc/smartdns
ENTRYPOINT ["/usr/sbin/smartdns", "-f", "-x"]

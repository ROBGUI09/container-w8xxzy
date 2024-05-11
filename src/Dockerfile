# syntax=docker/dockerfile:1
FROM pymumu/smartdns:latest
#WORKDIR /etc/smartdns
RUN mkdir -p /etc/smartdns
COPY ./smartdns.conf /etc/smartdns
CMD ["/usr/sbin/smartdns", "-f", "-x"]

# syntax=docker/dockerfile:1
FROM scratch
WORKDIR /etc/smartdns
RUN mkdir -p /etc/smartdns
COPY ./smartdns.conf /etc/smartdns/smartdns.conf
COPY ./entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

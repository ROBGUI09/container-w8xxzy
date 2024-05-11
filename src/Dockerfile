# syntax=docker/dockerfile:1
FROM pymumu/smartdns:latest
#WORKDIR /etc/smartdns
RUN mkdir -p /etc/smartdns
COPY ./smartdns.conf /etc/smartdns
COPY ./ep.sh /ep.sh
EXPOSE 5000/tcp
ENTRYPOINT ["/ep.sh"]

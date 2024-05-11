# syntax=docker/dockerfile:1
FROM pymumu/smartdns:latest
#WORKDIR /etc/smartdns
RUN mkdir -p /etc/smartdns
COPY ./smartdns.conf /etc/smartdns
COPY ./ep.sh /ep.sh
RUN apt update && apt install -y python3 python3-pip && pip3 install wheel doh-proxy
EXPOSE 443/tcp
ENTRYPOINT ["/ep.sh"]

# syntax=docker/dockerfile:1
FROM pymumu/smartdns:latest as smartdns
FROM python:3-alpine
COPY --from=smartdns /usr/sbin/smartdns /usr/sbin/smartdns
ENV PYTHONUNBUFFERED=1
WORKDIR /etc/smartdns
RUN mkdir -p /etc/smartdns
RUN pip install -U Flask gunicorn requests
RUN apk add openssl
RUN openssl req -new -newkey rsa:4096 -days 3650 -nodes -x509 \
    -subj "/C=RU/ST=Denis/L=Cumfield/O=Dicks/CN=localhost" \
    -keyout /etc/smartdns/smartdns-key.pem  -out /etc/smartdns/smartdns-cert.pem
COPY ./smartdns.conf /etc/smartdns
COPY ./app.py /etc/smartdns
COPY ./ep.sh /ep.sh
EXPOSE 5000/tcp
ENTRYPOINT ["/ep.sh"]

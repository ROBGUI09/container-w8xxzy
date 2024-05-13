# syntax=docker/dockerfile:1
FROM pymumu/smartdns:latest as smartdns
FROM python:3-alpine
COPY --from=smartdns /usr/sbin/smartdns /usr/sbin/smartdns
ENV PYTHONUNBUFFERED=1
WORKDIR /etc/smartdns
RUN mkdir -p /etc/smartdns
RUN pip install -U Flask gunicorn requests
RUN apk add openssl
RUN openssl genrsa -out smartdns-key.pem -batch 2048
RUN openssl req -x509 -sha256 -new -nodes -key smartdns-key.pem -batch -days 3650 -out smartdns-cert.pem
COPY ./smartdns.conf /etc/smartdns
COPY ./app.py /etc/smartdns
COPY ./ep.sh /ep.sh
EXPOSE 5000/tcp
ENTRYPOINT ["/ep.sh"]

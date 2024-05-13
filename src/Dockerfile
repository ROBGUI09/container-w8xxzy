# syntax=docker/dockerfile:1
FROM pymumu/smartdns:latest as smartdns
FROM python:3-alpine
COPY --from=smartdns /usr/sbin/smartdns /usr/sbin/smartdns
ENV PYTHONUNBUFFERED=1
WORKDIR /etc/smartdns
RUN mkdir -p /etc/smartdns
RUN pip install -U Flask gunicorn requests
COPY ./smartdns.conf /etc/smartdns
COPY ./app.py /etc/smartdns
COPY ./ep.sh /ep.sh
EXPOSE 443/tcp
ENTRYPOINT ["/ep.sh"]

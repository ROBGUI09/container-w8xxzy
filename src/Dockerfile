# syntax=docker/dockerfile:1
FROM pymumu/smartdns:latest as smartdns
FROM rust:latest as rust
RUN rustup target add x86_64-unknown-linux-musl
RUN cargo install doh-proxy --no-default-features --target x86_64-unknown-linux-musl
FROM alpine:latest
#FROM python:3-alpine
COPY --from=rust /usr/local/cargo/bin/doh-proxy /usr/sbin/doh-proxy
COPY --from=smartdns /usr/sbin/smartdns /usr/sbin/smartdns
#ENV PYTHONUNBUFFERED=1
#WORKDIR /etc/smartdns
RUN mkdir -p /etc/smartdns
#RUN pip install -U doh-proxy
COPY ./smartdns.conf /etc/smartdns
COPY ./ep.sh /ep.sh
EXPOSE 443/tcp
ENTRYPOINT ["/ep.sh"]

# --- Stage 1: Build ---
FROM alpine:3.18 AS builder

RUN apk add --no-cache \
    build-base \
    sqlite-dev \
    libevent-dev \
    pcre-dev \
    curl-dev \
    openssl-dev \
    wget \
    net-snmp-dev \
    cmake \
    gnupg \
    bash \
    pkgconfig \
    zlib-dev

WORKDIR /build
COPY ./src /build/zabbix-5.0.46

WORKDIR /build/zabbix-5.0.46

RUN ./configure \
    --enable-proxy \
    --with-sqlite3 \
    --with-net-snmp \
    --disable-agent \
    --disable-server \
    --disable-java \
    --prefix=/opt/zabbix && \
    make && make install

# --- Stage 2: Runtime ---
FROM alpine:3.18

RUN apk add --no-cache \
    sqlite-libs \
    libevent \
    pcre \
    net-snmp-libs \
    openssl \
    curl \
    bash \
    fping \
    shadow \
    su-exec \
    gettext

COPY --from=builder /opt/zabbix /opt/zabbix
COPY start.sh /start.sh 
RUN addgroup -S zabbix && adduser -S -G zabbix zabbix
RUN mkdir -p /etc/zabbix /var/log/zabbix && chown -R zabbix:zabbix /etc/zabbix /var/log/zabbix
RUN chmod u+s /usr/sbin/fping
RUN chmod +x /start.sh

# No CMD or ENTRYPOINT here – it's handled by package.yaml or Cisco run-opts
# COPY --from=builder /opt/zabbix /opt/zabbix

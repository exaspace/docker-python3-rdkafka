# Latest python & RD_KAFKA versions as of 2019-06-10

FROM python:3.7.3-alpine3.9 

ENV LIB_RD_KAFKA_VERSION=1.0.0

RUN apk add --update \
    bash \
    build-base \
    ca-certificates \
    musl-dev \
    openssl \
    tar \
    && update-ca-certificates \
    && wget -O - https://github.com/edenhill/librdkafka/archive/v${LIB_RD_KAFKA_VERSION}.tar.gz | tar xzf - \
    && cd librdkafka-${LIB_RD_KAFKA_VERSION} && ./configure --prefix=/usr && make && make install


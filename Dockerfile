#
# Uses the latest stable Python3 & RD_KAFKA versions available on 2022-11-26
#


FROM python:3.11.0-alpine3.16 AS build
ENV LIB_RD_KAFKA_VERSION=2.0.2
RUN apk add --update \
    bash \
    build-base \
    ca-certificates \
    musl-dev \
    openssl \
    tar 
RUN wget -O - https://github.com/confluentinc/librdkafka/archive/v${LIB_RD_KAFKA_VERSION}.tar.gz | tar xzf - 
RUN cd librdkafka-${LIB_RD_KAFKA_VERSION} \
    && ./configure --prefix=/usr \
    && make \
    && make install

FROM python:3.11.0-alpine3.16
ENV LIB_RD_KAFKA_VERSION=2.0.2
COPY --from=build /usr /usr
RUN pip install confluent-kafka==${LIB_RD_KAFKA_VERSION}

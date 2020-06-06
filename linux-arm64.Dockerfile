FROM alpine@sha256:ad295e950e71627e9d0d14cdc533f4031d42edae31ab57a841c5b9588eacc280
LABEL maintainer="hotio"
ENTRYPOINT ["borg"]

ARG BORG_VERSION

RUN apk add --no-cache libacl py3-pyzmq py3-setuptools python3 fuse && \
    apk add --no-cache --virtual=build-dependencies py3-pip python3-dev openssl-dev acl-dev fuse-dev build-base linux-headers && \
    apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing py3-pkgconfig && \
    pip3 install --no-cache-dir --upgrade borgbackup[fuse]==${BORG_VERSION} && \
    apk del --purge build-dependencies py3-pkgconfig

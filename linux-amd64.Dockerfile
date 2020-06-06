FROM alpine@sha256:a15790640a6690aa1730c38cf0a440e2aa44aaca9b0e8931a9f2b0d7cc90fd65
LABEL maintainer="hotio"
ENTRYPOINT ["borg"]

ARG BORG_VERSION

RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/v3.11/main libacl lz4-libs zstd-libs fuse py3-pyzmq py3-setuptools python3 && \
    apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/v3.11/main --virtual=build-dependencies py3-pip python3-dev openssl-dev acl-dev fuse-dev build-base linux-headers && \
    pip3 install --no-cache-dir --upgrade borgbackup[fuse]==${BORG_VERSION} && \
    apk del --purge build-dependencies

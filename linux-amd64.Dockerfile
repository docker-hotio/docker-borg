FROM alpine@sha256:39eda93d15866957feaee28f8fc5adb545276a64147445c64992ef69804dbf01
LABEL maintainer="hotio"
ENTRYPOINT ["borg"]

ARG BORG_VERSION

RUN apk add --no-cache libacl lz4-libs py3-pyzmq py3-setuptools python3 zstd-libs fuse && \
    apk add --no-cache --virtual=build-dependencies py3-pip python3-dev openssl-dev acl-dev fuse-dev build-base linux-headers && \
    pip3 install --no-cache-dir --upgrade borgbackup[fuse]==${BORG_VERSION} && \
    apk del --purge build-dependencies

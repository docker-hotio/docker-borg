FROM alpine@sha256:19c4e520fa84832d6deab48cd911067e6d8b0a9fa73fc054c7b9031f1d89e4cf
LABEL maintainer="hotio"
ENTRYPOINT ["borg"]

ARG BORG_VERSION

RUN apk add --no-cache libacl lz4-libs py3-pyzmq py3-setuptools python3 zstd-libs fuse py3-msgpack && \
    apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing --virtual=build-dependencies py3-pip py3-pkgconfig python3-dev openssl-dev acl-dev fuse-dev build-base linux-headers && \
    pip3 install --no-cache-dir --upgrade borgbackup[fuse]==${BORG_VERSION} && \
    apk del --purge build-dependencies

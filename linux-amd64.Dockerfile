FROM alpine@sha256:a9c28c813336ece5bb98b36af5b66209ed777a394f4f856c6e62267790883820
LABEL maintainer="hotio"
ENTRYPOINT ["borg"]

ARG VERSION

RUN apk add --no-cache libacl libattr fuse py3-pyzmq py3-setuptools python3 py3-msgpack && \
    apk add --no-cache --virtual=build-dependencies acl-dev attr-dev fuse-dev py3-pip python3-dev openssl-dev build-base linux-headers && \
    apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community py3-pkgconfig && \
    pip3 install --no-cache-dir --upgrade borgbackup[fuse]==${VERSION} && \
    apk del --purge build-dependencies py3-pkgconfig

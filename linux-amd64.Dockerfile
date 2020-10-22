FROM alpine@sha256:d7342993700f8cd7aba8496c2d0e57be0666e80b4c441925fc6f9361fa81d10e
LABEL maintainer="hotio"
ENTRYPOINT ["borg"]

ARG VERSION

RUN apk add --no-cache libacl libattr fuse py3-pyzmq py3-setuptools python3 && \
    apk add --no-cache --virtual=build-dependencies acl-dev attr-dev fuse-dev py3-pip python3-dev openssl-dev build-base linux-headers && \
    apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing py3-pkgconfig && \
    pip3 install --no-cache-dir --upgrade borgbackup[fuse]==${VERSION} && \
    apk del --purge build-dependencies py3-pkgconfig

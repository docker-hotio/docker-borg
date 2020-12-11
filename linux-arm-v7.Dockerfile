FROM alpine@sha256:31f1a8999b1f0c0fcea456e9045befee41572ed6c24ae04fec36e6795bd28ee4
LABEL maintainer="hotio"
ENTRYPOINT ["borg"]

ARG VERSION

RUN apk add --no-cache libacl libattr fuse py3-pyzmq py3-setuptools python3 py3-msgpack && \
    apk add --no-cache --virtual=build-dependencies acl-dev attr-dev fuse-dev py3-pip python3-dev openssl-dev build-base linux-headers && \
    apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing py3-pkgconfig && \
    pip3 install --no-cache-dir --upgrade borgbackup[fuse]==${VERSION} && \
    apk del --purge build-dependencies py3-pkgconfig

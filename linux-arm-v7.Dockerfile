FROM alpine@sha256:299294be8699c1b323c137f972fd0aa5eaa4b95489c213091dcf46ef39b6c810
LABEL maintainer="hotio"
ENTRYPOINT ["borg"]

ARG VERSION

RUN apk add --no-cache libacl libattr fuse py3-pyzmq py3-setuptools python3 && \
    apk add --no-cache --virtual=build-dependencies acl-dev attr-dev fuse-dev py3-pip python3-dev openssl-dev build-base linux-headers && \
    apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing py3-pkgconfig && \
    pip3 install --no-cache-dir --upgrade borgbackup[fuse]==${VERSION} && \
    apk del --purge build-dependencies py3-pkgconfig

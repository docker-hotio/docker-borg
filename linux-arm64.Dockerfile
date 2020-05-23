FROM ubuntu@sha256:03e4a3b262fd97281d7290c366cae028e194ae90931bc907991444d026d6392a
LABEL maintainer="hotio"

ARG DEBIAN_FRONTEND="noninteractive"

ENTRYPOINT ["borg"]

ARG BORG_VERSION

# install
RUN apt update && \
    apt install -y --no-install-recommends --no-install-suggests \
        fuse python3 python3-pkg-resources libssl1.1 libacl1 \
        libfuse-dev python3-pip python3-setuptools build-essential python3-all-dev pkg-config python3-pkgconfig libssl-dev libacl1-dev && \
    pip3 install --no-cache-dir --upgrade borgbackup[fuse]==${BORG_VERSION} && \
# clean up
    apt purge -y libfuse-dev python3-pip python3-setuptools build-essential python3-all-dev pkg-config python3-pkgconfig libssl-dev libacl1-dev && \
    apt autoremove -y && \
    apt clean && \
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

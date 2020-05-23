FROM ubuntu@sha256:03e4a3b262fd97281d7290c366cae028e194ae90931bc907991444d026d6392a
LABEL maintainer="hotio"

ARG DEBIAN_FRONTEND="noninteractive"

ENTRYPOINT ["/usr/local/bin/borg"]

ARG BORG_VERSION_ARM64

RUN wget https://dl.bintray.com/borg-binary-builder/borg-binaries/borg-${BORG_VERSION_ARM64}}-arm64 -O /usr/local/bin/borg && chmod 755 /usr/local/bin/borg

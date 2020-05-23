FROM ubuntu@sha256:b58746c8a89938b8c9f5b77de3b8cf1fe78210c696ab03a1442e235eea65d84f
LABEL maintainer="hotio"

ARG DEBIAN_FRONTEND="noninteractive"

ENTRYPOINT ["/usr/local/bin/borg"]

ARG BORG_VERSION_AMD64

RUN wget https://github.com/borgbackup/borg/releases/download/${BORG_VERSION_AMD64}/borg-linux64 -O /usr/local/bin/borg && chmod 755 /usr/local/bin/borg

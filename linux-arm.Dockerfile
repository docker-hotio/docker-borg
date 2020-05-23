FROM ubuntu@sha256:214d66c966334f0223b036c1e56d9794bc18b71dd20d90abb28d838a5e7fe7f1
LABEL maintainer="hotio"

ARG DEBIAN_FRONTEND="noninteractive"

ENTRYPOINT ["/usr/local/bin/borg"]

ARG BORG_VERSION_ARM

ADD https://dl.bintray.com/borg-binary-builder/borg-binaries/borg-${BORG_VERSION_ARM}-armv6 /usr/local/bin/borg
RUN chmod 755 /usr/local/bin/borg

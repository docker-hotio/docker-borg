#!/bin/bash

if [[ ${1} == "checkdigests" ]]; then
    mkdir ~/.docker && echo '{"experimental": "enabled"}' > ~/.docker/config.json
    image="ubuntu"
    tag="18.04"
    manifest=$(docker manifest inspect ${image}:${tag})
    [[ -z ${manifest} ]] && exit 1
    digest=$(echo "${manifest}" | jq -r '.manifests[] | select (.platform.architecture == "amd64" and .platform.os == "linux").digest') && sed -i "s#FROM ${image}.*\$#FROM ${image}@${digest}#g" ./linux-amd64.Dockerfile && echo "${digest}"
    digest=$(echo "${manifest}" | jq -r '.manifests[] | select (.platform.architecture == "arm" and .platform.os == "linux").digest')   && sed -i "s#FROM ${image}.*\$#FROM ${image}@${digest}#g" ./linux-arm.Dockerfile   && echo "${digest}"
    digest=$(echo "${manifest}" | jq -r '.manifests[] | select (.platform.architecture == "arm64" and .platform.os == "linux").digest') && sed -i "s#FROM ${image}.*\$#FROM ${image}@${digest}#g" ./linux-arm64.Dockerfile && echo "${digest}"
else
    version_amd64=$(curl -u "${GITHUB_ACTOR}:${GITHUB_TOKEN}" -fsSL "https://api.github.com/repos/borgbackup/borg/releases/latest" | jq -r .tag_name | sed s/v//g)
    [[ -z ${version_amd64} ]] && exit 1
    version_arm64=$(curl -fsSL "https://borg.bauerj.eu/binaries.json" | jq -r '.arm64.version')
    [[ -z ${version_arm64} ]] && exit 1
    version_arm=$(curl -fsSL "https://borg.bauerj.eu/binaries.json" | jq -r '.armv6.version')
    [[ -z ${version_arm} ]] && exit 1
    sed -i "s/{BORG_VERSION_AMD64=[^}]*}/{BORG_VERSION_AMD64=${version_amd64}}/g" .drone.yml
    sed -i "s/{BORG_VERSION_ARM64=[^}]*}/{BORG_VERSION_ARM64=${version_arm64}}/g" .drone.yml
    sed -i "s/{BORG_VERSION_ARM=[^}]*}/{BORG_VERSION_ARM=${version_arm}}/g" .drone.yml
    version="${version_amd64}/${version_arm64}/${version_arm}"
    echo "##[set-output name=version;]${version}"
fi

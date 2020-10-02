# borg

![logo](https://hotio.dev/img/borg.png)

![Base](https://img.shields.io/badge/base-alpine-blue)
[![GitHub](https://img.shields.io/badge/source-github-lightgrey)](https://github.com/hotio/docker-borg)
[![Docker Pulls](https://img.shields.io/docker/pulls/hotio/borg)](https://hub.docker.com/r/hotio/borg)
[![GitHub Registry](https://img.shields.io/badge/registry-ghcr.io-blue)](https://github.com/users/hotio/packages/container/borg/versions)
[![Discord](https://img.shields.io/discord/610068305893523457?color=738ad6&label=discord&logo=discord&logoColor=white)](https://discord.gg/3SnkuKp)
[![Upstream](https://img.shields.io/badge/upstream-project-yellow)](https://github.com/borgbackup/borg)

## Starting the container

Just the basics to get the container running:

```shell
docker run --rm hotio/borg ...
```

The default `ENTRYPOINT` is `borg`.

## Tags

| Tag                | Upstream            |
| -------------------|---------------------|
| `release` (latest) | GitHub releases     |
| `testing`          | GitHub pre-releases |

You can also find tags that reference a commit or version number.

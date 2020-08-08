# borg

<img src="https://raw.githubusercontent.com/hotio/docker-borg/master/img/borg.png" alt="Logo" height="130">

![Base](https://img.shields.io/badge/base-alpine-blue)
[![GitHub](https://img.shields.io/badge/source-github-lightgrey)](https://github.com/hotio/docker-borg)
[![Docker Pulls](https://img.shields.io/docker/pulls/hotio/borg)](https://hub.docker.com/r/hotio/borg)
[![Discord](https://img.shields.io/discord/610068305893523457?color=738ad6&label=discord&logo=discord&logoColor=white)](https://discord.gg/3SnkuKp)
[![Upstream](https://img.shields.io/badge/upstream-project-yellow)](https://github.com/borgbackup/borg)

## Starting the container

Just the basics to get the container running:

```shell
docker run --rm hotio/borg ...
```

The default `ENTRYPOINT` is `borg`.

## Tags

| Tag      | Description                    |
| ---------|--------------------------------|
| latest   | The same as `stable`           |
| stable   | Stable version                 |
| unstable | Unstable Pre-releases          |

You can also find tags that reference a commit or version number.

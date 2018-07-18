# Docker

We provide a [swiftenv image for
Docker](https://hub.docker.com/r/kylef/swiftenv/). You can pull it down to use
Swiftenv and Swift in Docker or base your own images from the swiftenv image.

Swiftenv provides multiple base docker images:

- `latest` - Image with swiftenv and all runtime dependencies to use Swift binaries.
- `build` - Image with swiftenv and all build dependencies to be able to build Swift from source.
- `swift3` - Image with swiftenv and the latest stable version of Swift 3.
- `swift` - Image with swiftenv and the latest stable version of Swift.

All of the docker images are based on top of Ubuntu 16.04 LTS (Xenial).

## Running the swiftenv image directly

You can pull down the `kylef/swiftenv` docker image and run it.

```shell
$ docker pull kylef/swiftenv
$ docker run -i -t --entrypoint /bin/sh kylef/swiftenv
# swiftenv --version
swiftenv 1.4.0
```

Or for swiftenv with latest Swift:

```shell
$ docker pull kylef/swiftenv:swift
$ docker run -i -t --entrypoint /bin/sh kylef/swiftenv
# swift --version
swift 3.0.1
```

## Building a docker image using swiftenv

You may base your own Docker image from the swiftenv image, you may then
install any Swift version you desire in your container.

```
FROM kylef/swiftenv
RUN swiftenv install 3.0
```

## `docker-compose`

Docker compose allows you to setup and run your project easier. It's a wrapper
around `docker`.

For example, we can create a service called `commander` on top of the swift3
swiftenv image which maps the source files into the docker container.

```yaml
version: '2.0'

services:
  commander:
    image: kylef/swiftenv:swift3
    volumes:
      - './Sources:/code/Sources'
      - './Tests:/code/Tests'
      - './Packages:/code/Packages'
      - './Package.swift:/code/Package.swift'
    working_dir: /code
    command: swift build
```

We can then use `docker-compose` to run commands such as `swift test` inside
our container.

```shell
$ docker-compose run commander swift test
```

You can switch out the `image` line of your service for `build: .` to build a
`Dockerfile` found in your repository instead of going straight from the
`swift3` image. This allows you to pin to a specific version of Swift.

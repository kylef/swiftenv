# Docker

We provide a [swiftenv image for
Docker](https://hub.docker.com/r/kylef/swiftenv/). You can pull it down to use
Swiftenv and Swift in Docker or base your own images from the swiftenv image.

## Running the swiftenv image directly

You can pull down the `kylef/swiftenv` docker image and run it.

```shell
$ docker pull kylef/swiftenv
$ docker run -i -t --entrypoint /bin/sh kylef/swiftenv
# swiftenv --version
swiftenv 1.2.0
```

Using the image, you can install any version of Swift you like and use it.

```shell
# swiftenv install 3.0
```

## Building a docker image using swiftenv

You may base your own Docker image from the swiftenv image, you may then
install any Swift version you desire.

```
FROM kylef/swiftenv
RUN swiftenv install 3.0
```

# CircleCI

You can use swiftenv in conjunction with Docker on
[CircleCI](https://circleci.com) to easily test your Swift project on CircleCI.

**NOTE:** *These instructions only cover using CircleCI on Linux and do not
apply to CircleCI macOS containers.*

### `Dockerfile`

A `Dockerfile` may contain the instructions to build a docker container
containing swiftenv, Swift and your source code.

The following `Dockerfile` shows an example of setting up swiftenv and
installing the version of Swift found in `.swift-version`.

You may also base your image on top of `kylef/swiftenv:swift3` or
`kylef/swiftenv:swift` to use pre-installed Swift versions.

```
FROM kylef/swiftenv

RUN mkdir -p /code
WORKDIR /code
ADD . /code

RUN swiftenv install
```

### `circle.yml`

Using a `circle.yml` file we can instruct CircleCI to build and run `swift
test` inside our docker container.

```yaml
machine:
  services: docker

dependencies:
  override: docker build -t myapp .

test:
  override: docker run myapp swift test
```

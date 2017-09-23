# Travis CI

You can use swiftenv to both install Swift, and to manage multiple
versions of Swift on [Travis CI](https://travis-ci.com/).

Using the [following `install` phase](https://swiftenv.fuller.li/install.sh), you can install both swiftenv and the
Swift version found in the `.swift-version` file or the `SWIFT_VERSION`
environment variable.

```yaml
install:
  - eval "$(curl -sL https://swiftenv.fuller.li/install.sh)"
```

## Operating Systems

### macOS

For macOS support on Travis, you will want to enable the `xcode7.2` or
newer image which contains a version of macOS and Xcode required for Swift.

```yaml
osx_image: xcode7.2
```

### Linux

The default Linux image on Travis CI doesn't have a version of Clang that
is required to use Swift. You can switch to the new Travis
[`trusty` build environment](https://docs.travis-ci.com/user/trusty-ci-environment/)
which contains Clang 3.5 using the following:

```yaml
language: generic
sudo: required
dist: trusty
```

### Multi-OS

swiftenv can be used on both macOS and Linux, you can use Travis
[multiple operating system](https://docs.travis-ci.com/user/multi-os/)
support by adding both platforms to the `os` key:

```yaml
os:
  - linux
  - osx
```

You can mix this together with the above steps required for macOS and
Linux to have a complete `.travis.yml` file as follows:

```yaml
os:
  - linux
  - osx
language: generic
sudo: required
dist: trusty
osx_image: xcode7.2
install:
  - eval "$(curl -sL https://swiftenv.fuller.li/install.sh)"
script:
  - swift build
```

## Testing against multiple Swift versions

You can use build matrix on Travis CI to set the `SWIFT_VERSION` environment
variable to different values. Travis will now run against multiple
versions of Swift.

```yaml
env:
  - SWIFT_VERSION=2.2-SNAPSHOT-2016-01-06-a
  - SWIFT_VERSION=DEVELOPMENT-SNAPSHOT-2016-02-08-a
```

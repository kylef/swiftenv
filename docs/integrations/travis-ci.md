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

For macOS support on Travis, you will need to enable a version of Xcode which
contains a support for the desired Swift version. See [Swift Documentation for
Requirements on Apple
platforms](https://swift.org/download/#requirements-for-tools).

For example, Swift 5.1 requires macOS 10.14.6 and Xcode 11 or later:

```yaml
osx_image: xcode11.3
```

### Linux

For Linux, Travis needs to be configured to use a compatible version of Ubuntu
and the surrounding tools.

Modern versions of Swift provided binary releases for Ubuntu 18.04 (also known
as bionic). Use the `dist` key in Travis CI to enable the [Ubuntu 18.04 bionic
runtime](https://docs.travis-ci.com/user/reference/bionic/).

```yaml
language: generic
sudo: required
dist: bionic
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
dist: buster
osx_image: xcode11.3
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
  - SWIFT_VERSION=4.2
  - SWIFT_VERSION=5.2.1
```

# Building Swift from Source

`swiftenv install` can install Swift from source.

Listing available versions.

```shell
$ swiftenv install --list
2.2
2.2-dev
3.0-dev
```

**NOTE**: *Swift 2.2 does not include the Swift Package Manager.*

```shell
$ swiftenv install 2.2
```

By default, Swift will download from an Apple binary release available from
swift.org. However you can use `--build` to force building the version.

```shell
$ swiftenv install 2.2 --build
```

## Platforms

Below you can find a list of specific dependencies for each platform.

### macOS

You will need to install the latest version of Xcode along with cmake
and ninja build to build Swift on macOS.

#### Via Homebrew

```shell
$ brew install cmake ninja
```

#### Via Mac Ports

```shell
$ sudo port install cmake ninja
```

### Arch Linux

You will need to install the following dependencies for Arch Linux:

```shell
$ pacman -S perl libbsd icu git libedit python2 clang cmake ninja
```

### Ubuntu

You will need to install the following dependencies on Ubuntu:

```shell
$ sudo apt-get install git cmake ninja-build clang python uuid-dev libicu-dev icu-devtools libbsd-dev libedit-dev libxml2-dev libsqlite3-dev swig libpython-dev libncurses5-dev pkg-config
```

If you are building on Ubuntu 14.04 LTS, you'll need to upgrade your clang
compiler for C++14 support and create a symlink:

```shell
$ sudo apt-get install clang-3.6
$ sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-3.6 100
$ sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-3.6 100
```

### FreeBSD

You will need to install the following dependencies on FreeBSD:

```shell
$ pkg install binutils git python ninja cmake pkgconf e2fsprogs-libuuid
```

### Your platform here

If you have successfully build Swift via swiftenv on other platforms, feel free
to [update this list with a pull request](https://github.com/kylef/swiftenv/blob/master/docs/building-swift.md).

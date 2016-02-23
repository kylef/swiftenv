# Getting Started

Once you've [installed](installation.html) swiftenv you can get started by
checking which existing versions of Swift you have installed.

```shell
$ swiftenv versions
  2.1.1
  2.2-SNAPSHOT-2016-01-11-a
  DEVELOPMENT-SNAPSHOT-2016-01-25-a
* DEVELOPMENT-SNAPSHOT-2016-02-08-a (set by /Users/kyle/.swiftenv/version)
```

**NOTE**: *swiftenv will automatically pick up any versions of Swift installed on
OS X by Xcode or Swift toolchains.*

## Installing Swift

You can install swift using `swiftenv install`.

```shell
$ swiftenv install DEVELOPMENT-SNAPSHOT-2016-02-08-a
```

## Switching Swift Versions

swiftenv allows you to switch between the installed Swift versions either
globally or locally. You can configure a global Swift version that is used
by default unless overridden.

### Global Version

You can check the current global Swift version using `swiftenv global`.

```shell
$ swiftenv global
DEVELOPMENT-SNAPSHOT-2016-02-08-a
```

To change the global version:

```shell
$ swiftenv global 2.1.1
```

### Local Version

You can override the global version within any project using a
`.swift-version` file. A Swift version file will indicate the version
to be used.

Setting the local Swift version:

```shell
$ swiftenv local DEVELOPMENT-SNAPSHOT-2016-02-08-a
```

Now, when you're inside the current directory, the Swift version will be
automatically changed to the local version.

```shell
$ swiftenv version
DEVELOPMENT-SNAPSHOT-2016-02-08-a (set by /Users/kyle/Projects/kylef/Curassow/.swift-version)
```

When you switch to another directory without a `.swift-version` file, the
global version will be used.

```shell
$ swiftenv version
2.1.1 (set by /Users/kyle/.swiftenv/version)
```

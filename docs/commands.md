# Command Reference

## `version`

Displays the current active Swift version and why it was chosen.

```shell
$ swiftenv version
2.2 (set by /home/kyle/.swiftenv/version)
```

## `versions`

Lists all installed Swift versions, showing an asterisk next to the currently
active version.

```shell
$ swiftenv versions
  2.1.1
* 2.2 (set by /home/kyle/.swiftenv/version)
  DEVELOPMENT-SNAPSHOT-2016-03-01-a
```

## `global`

Sets the global version of Swift to be used by writing to the
`~/.swiftenv/version` file. This version can be overridden by
application-specific `.swift-version` file, or by setting the `SWIFT_VERSION`
environment variable.

```shell
$ swiftenv global 2.2
$ swiftenv global
2.2
```

## `local`

Sets the local application-specific Swift version by writing the version to a
`.swift-version` file in the current directory. This version overrides the
global version and can also be overridden further by the `SWIFT_VERSION`
environment variable.

### Setting a local Swift version

```shell
$ swiftenv local 3.1.1
```

Setting the local swift version will write the version to the `.swift-version`
file in the current working directory.

### Checking the local Swift version

```shell
$ swiftenv local
3.1.1
```

## `install`

Installs a version of Swift. This supports both binary releases provided by
Apple, along with all open source Swift releases.

You may use `--build` or `--no-build` to force a building from source, or
installing from a binary release. Otherwise swiftenv will prefer installing
from a binary release if available.

Please see [Building Swift from source](/building-swift.html) for more information.

```shell
$ swiftenv install 2.2
```

You may also install from a user supplied  URLs to a Swift Binary package URL from [Swift Snapshots](https://swift.org/download/#latest-development-snapshots) as a parameter

### Installing Swift from a URL

You may pass a URL of a binary Swift release directly to swiftenv install.

```shell
$ swiftenv install https://swift.org/builds/development/xcode/swift-DEVELOPMENT-SNAPSHOT-2016-03-01-a/swift-DEVELOPMENT-SNAPSHOT-2016-03-01-a-osx.pkg
Downloading https://swift.org/builds/development/xcode/swift-DEVELOPMENT-SNAPSHOT-2016-03-01-a/swift-DEVELOPMENT-SNAPSHOT-2016-03-01-a-osx.pkg
```

### Custom Installation

You may also manually install Swift and make it accessible to swiftenv. Custom
Swift installations can either be placed in a directory using the correct
version number at `~/.swiftenv/versions/VERSION`, or can be symbolic
linked into the version directory.

It is expected that all dependencies are already installed for running Swift,
please consult the [Swift website](https://swift.org/download/) for more
information.

**NOTE**: *After manually installing a version of Swift, it's recommended that
you run `swiftenv rehash` to update the shims.*

### Verifying Linux Binary Packages

When downloading a pre-built binary package, swiftenv can also download the corresponding signature and verify it with gpg. This option assumes gpg is installed on the system, and the [Swift public keys](https://swift.org/download/#active-signing-keys) already exist on the public gpg keyring. If verification fails, the version will not be installed. Signatures are currently only checked in this way for Linux builds.

```shell
$ swiftenv install 2.2 --verify
```

## `uninstall`

Uninstalls a specific Swift version.

```shell
$ swiftenv uninstall 2.2
```

## `rehash`

Installs shims for the Swift binaries. This command should be ran after you
manually install new versions of Swift.

```shell
$ swiftenv rehash
```

## `which`

Displays the full path to the executable that would be invoked for the selected
version for the given command.

```shell
$ swiftenv which swift
/home/kyle/.swiftenv/versions/2.2/usr/bin/swift

$ swiftenv which lldb
/home/kyle/.swiftenv/versions/2.2/usr/bin/lldb
```

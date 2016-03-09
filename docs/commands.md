# Command Reference

## `version`

Displays the current active Swift version and why it was chosen.

```shell
$ swiftenv version
2.2-SNAPSHOT-2015-12-10-a (set by /home/kyle/.swiftenv/version)
```

## `versions`

Lists all installed Swift versions, showing an asterisk next to the currently
active version.

```shell
$ swiftenv versions
  2.2-SNAPSHOT-2015-12-01-b
* 2.2-SNAPSHOT-2015-12-10-a (set by /home/kyle/.swiftenv/version)
```

## `global`

Sets the global version of Swift to be used by writing to the
`~/.swiftenv/version` file. This version can be overridden by
application-specific `.swift-version` file, or by setting the `SWIFT_VERSION`
environment variable.

```shell
$ swiftenv global 2.2-SNAPSHOT-2015-12-10-a
$ swiftenv global
2.2-SNAPSHOT-2015-12-10-a
```

## `local`

Sets the local application-specific Swift version by writing the version to a
`.swift-version` file in the current directory. This version overrides the
global version and can also be overridden by th `SWIFT_VERSION` environment
variable.

```shell
$ swiftenv local 2.2-SNAPSHOT-2015-12-10-a
$ swiftenv local
2.2-SNAPSHOT-2015-12-10-a
```

## `install`

Installs a version of Swift. This supports any binary release provides by
Apple. For example, a 2.2 snapshots such as `2.2-SNAPSHOT-2016-01-11-a`.

You may also specify `2.2-dev` to build Swift from source, this will require
all of the dependencies mention on
[Swift system
requirements](https://github.com/apple/swift#system-requirements). It is
important to note that the Swift Package Manager will not be installed with
`2.2-dev` as Swift Package Manager is still in early development and it won't
be included in 2.2, however it is available in the development binary snapshots.

```shell
$ swiftenv install 2.2-SNAPSHOT-2016-01-11-a
Downloading 2.2-SNAPSHOT-2016-01-11-a from https://swift.org/builds/ubuntu1510/swift-2.2-SNAPSHOT-2016-01-11-a/swift-2.2-SNAPSHOT-2016-01-11-a-ubuntu15.10.tar.gz
```

You may also use URLs to a Swift Binary package URL from [Swift Snapshots](https://swift.org/download/#latest-development-snapshots) as a parameter 
```shell
$ swiftenv install https://swift.org/builds/development/xcode/swift-DEVELOPMENT-SNAPSHOT-2016-03-01-a/swift-DEVELOPMENT-SNAPSHOT-2016-03-01-a-osx.pkg
Downloading https://swift.org/builds/development/xcode/swift-DEVELOPMENT-SNAPSHOT-2016-03-01-a/swift-DEVELOPMENT-SNAPSHOT-2016-03-01-a-osx.pkg
Password:
```

You may also manually install Swift and make it accessible to swiftenv. Custom
Swift installations can either be placed in a directory using the correct
version number at `~/.swiftenv/versions/VERSION`, or can be symbolic
linked into the version directory.

It is expected that all dependencies are already installed for running Swift,
please consult the [Swift website](https://swift.org/download/) for more
information.

**NOTE**: *After manually installing a version of Swift, it's recommended that
you run `swiftenv rehash` to update the shims.*

## `uninstall`

Uninstalls a specific Swift version.

```shell
$ swiftenv uninstall 2.2-SNAPSHOT-2015-12-10-a
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
/home/kyle/.swiftenv/versions/swift-2.2-SNAPSHOT-2015-12-10-a/usr/bin/swift

$ swiftenv which lldb
/home/kyle/.swiftenv/versions/swift-2.2-SNAPSHOT-2015-12-10-a/usr/bin/lldb
```

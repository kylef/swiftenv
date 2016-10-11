# Changelog

## 1.2.1

### Enhancements

- Adds usage and summaries when using `swiftenv --help` with a subcommand.
- Adds a manpage for `swiftenv` and `swiftenv-install`.

  ```shell
  $ man swiftenv
  $ man swiftenv-install
  ```

### Bug Fixes

- Fixes detecting Swift release toolchains on macOS.
- Fixes an issue where `swiftenv install` wouldn't emit an error if it
  couldn't find instructions to install the given version.


## 1.2.0

### Enhancements

- Only create shims for `swift*` and `lldb*` binaries found within Xcode
  installs. Before we created shims for all executable tools found in Xcode
  and created shims for tools like ctags, cc, clang, etc.
- Adds support for installing binary GM releases.

### Bug Fixes

- Expose not found errors when using `swiftenv exec` against unknown commands.
- Swift preview versions such as `3.0-preview-1` will be detected as binary
  versions when using `swiftenv install`.


## 1.1.0

### Enhancements

- Add a `--skip-existing`/`-s` flag to `swiftenv install` to skip installation
  if version is already installed.
- Adds support for Swift toolchains installed into
  `~/Library/Developer/Toolchains/` on OS X.


## 1.0.2

### Bug Fixes

- Adds support for installing preview snapshots such as
  `3.0-preview-1-SNAPSHOT-2016-05-31-a`.
- `swiftenv init` will now cause a rehash if the version of swiftenv has
  changed.


## 1.0.1

### Enhancements

- Added `swiftenv install --list-snapshots` which shows you a list of
  snapshots for your platform.

### Bug Fixes

- Adds support for building Swift 2.2.1 from source, and installing 2.2.1
  development snapshots.
- `swiftenv uninstall` will now uninstall Swift toolchains on OS X.
- `swiftenv uninstall` will now inform you if you're trying to uninstall
  a version of Swift bundled with Xcode.


## 1.0.0

### Enhancements

- Supports installing final Swift releases such as `2.2`.

### Bug Fixes

- Swift toolchains 'latest' version is no longer shown in `swiftenv versions`
  on OS X.
- Fixes a problem where `swiftenv install` on Linux will incorrectly
  determine URL for the Swift binaries.
- Adds a `--verbose` mode to `swiftenv versions` to show where the version was
  installed.


## 0.5.0

### Enhancements

- The `swift-` prefix for versions is now optional.
- `swiftenv install` now has a `--list` option:

    ```shell
    $ swiftenv install --list
    ```

- `swiftenv install` is capable of building Swift `2.2-dev` from source.
- `swiftenv install` now takes URLs to a Swift binary package.
- `swiftenv install` was updated to use the new binary swift.org release URLs.

### Bug Fixes

- Fixes an issue where using shims would suppress error messages when the
  configured version was not installed.
- Allows the completion to work when using swiftenv installed from Homebrew.

## 0.4.0

### Enhancements

- Adds support for command and argument completions.

## 0.3.2

### Bug Fixes

- Performance improvement when running on OS X. In previous versions, during
  initialisation swiftenv with rehash the environment, unfortunately once we
  added support for Xcode's Swift there was a huge negative performance impact
  due to Xcode tools taking large amount of time due to the underlying commands
  being tremendously slow.

## 0.3.1

### Bug Fixes

- Improved error reporting when trying to install a non-existent Swift version.
- When a shim command isn't found in version, search PATH too. This fixes a
  problem when using swiftenv on OS X with Xcode installed while your Swift
  version is configured to a snapshot from swift.org.

## 0.3.0

### Enhancements

- `swiftenv install` can now install Swift on OS X.

## 0.2.1

### Bug Fixes

* Fixes an issue when installing via Homebrew and the `$SWIFTENV_ROOT`
  directory didn't exist.

## 0.2.0

### Enhancements

* Adds support for versions of Swift included in Xcode.
* Added `swiftenv --help`.

## 0.1.0

Initial release.

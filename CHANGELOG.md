# Changelog

## Master

### Enhancements

- The `swift-` prefix for versions is now optional.

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

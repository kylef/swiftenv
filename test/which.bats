#!/usr/bin/env bats

load helpers

@test "finds binary from selected Swift version" {
  binpath="$SWIFTENV_ROOT/versions/known-1.2.0/usr/bin"
  mkdir -p "$binpath"
  touch "$binpath/swift"
  chmod +x "$binpath/swift"
  export SWIFT_VERSION=known-1.2.0

  run swiftenv which swift
  [ "$status" -eq 0 ]
  [ "$lines" = "$binpath/swift" ]
}

@test "errors when it cannot find the binary in selected Swift version" {
  binpath="$SWIFTENV_ROOT/versions/known-1.2.0/usr/bin"
  mkdir -p "$binpath"
  touch "$binpath/swift"
  chmod +x "$binpath/swift"
  export SWIFT_VERSION=known-1.2.0

  run swiftenv which swiftc
  [ "$status" -eq 127 ]
}

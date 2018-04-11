#!/usr/bin/env bats

@test "can install a Swift development snapshot" {
  version="DEVELOPMENT-SNAPSHOT-2016-10-01-a"
  run swiftenv install "$version"
  [ "$status" -eq 0 ]

  run env SWIFT_VERSION="$version" swift --version
  echo $lines
  [ "$status" -eq 0 ]
  [[ "${lines[0]}" = *"Swift version 3.0-dev (LLVM d735cf71a5, Clang 035a4bf71a, Swift 42d3b18f2c)" ]]
}

@test "can install a Swift stable" {
  if [[ "$(uname -s)" == "Darwin" ]]; then
    # Xcode already bundles Swift
    skip
  fi

  run swiftenv install 4.1
  [ "$status" -eq 0 ]

  run env SWIFT_VERSION="4.1" swift --version
  [ "$status" -eq 0 ]
  [[ "${lines[0]}" = *"Swift version 4.1 (swift-4.1-RELEASE)" ]]
}

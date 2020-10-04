#!/usr/bin/env bats

@test "can install a Swift stable release" {
  if [[ "$(uname -s)" == "Darwin" ]]; then
    # Xcode already bundles Swift
    skip
  fi

  run swiftenv install 5.3
  echo "Installed"
  echo $lines
  [ "$status" -eq 0 ]

  run env SWIFT_VERSION="5.3" swift --version
  echo "Version"
  echo $lines
  [ "$status" -eq 0 ]
  [[ "${lines[0]}" = *"Swift version 5.3 (swift-5.3-RELEASE)" ]]
}

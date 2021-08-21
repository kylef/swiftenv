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

@test "can install a binary Swift development snapshot" {
  run swiftenv install DEVELOPMENT-SNAPSHOT-2021-08-17-a
  echo "Installed"
  echo $lines
  [ "$status" -eq 0 ]

  run env SWIFT_VERSION="DEVELOPMENT-SNAPSHOT-2021-08-17-a" swift --version
  echo "Version"
  echo $lines
  [ "$status" -eq 0 ]
  [[ "${lines[0]}" = *"Swift version 5.6-dev"* ]]
}

@test "can install a versioned binary Swift development snapshot" {
  run swiftenv install 5.5-DEVELOPMENT-SNAPSHOT-2021-08-19-a
  echo "Installed"
  echo $lines
  [ "$status" -eq 0 ]

  run env SWIFT_VERSION="5.5-DEVELOPMENT-SNAPSHOT-2021-08-19-a" swift --version
  echo "Version"
  echo $lines
  [ "$status" -eq 0 ]
  [[ "${lines[0]}" = *"Swift version 5.5-dev"* ]]
}

#!/usr/bin/env bats

load helpers

@test "defaults the version to system" {
  run swiftenv version
  [ "$status" -eq 0 ]
  [ "$lines" = "system (set by $SWIFTENV_ROOT/version)" ]

  run swiftenv version-name
  [ "$status" -eq 0 ]
  [ "$lines" = "system" ]
}

@test "allows setting a global version" {
  echo "test-5.0.0" > $SWIFTENV_ROOT/version

  run swiftenv version
  [ "$status" -eq 0 ]
  [ "$lines" = "test-5.0.0 (set by $SWIFTENV_ROOT/version)" ]

  run swiftenv version-name
  [ "$status" -eq 0 ]
  [ "$lines" = "test-5.0.0" ]
}

@test "allows overridding the global version with a local version" {
  echo "test-5.0.0" > $SWIFTENV_ROOT/version
  echo "test-4.0.0" > $SWIFTENV_HOME/.swift-version

  run swiftenv version
  [ "$status" -eq 0 ]
  [ "$lines" = "test-4.0.0 (set by $SWIFTENV_HOME/.swift-version)" ]

  run swiftenv version-name
  [ "$status" -eq 0 ]
  [ "$lines" = "test-4.0.0" ]
}

@test "allows overridding both global and local version with env variable" {
  echo "test-5.0.0" > $SWIFTENV_ROOT/version
  echo "test-4.0.0" > $SWIFTENV_HOME/.swift-version
  export SWIFT_VERSION="test-4.5.0"

  run swiftenv version
  [ "$status" -eq 0 ]
  [ "$lines" = "test-4.5.0 (set by SWIFT_VERSION environment variable)" ]

  run swiftenv version-name
  [ "$status" -eq 0 ]
  [ "$lines" = "test-4.5.0" ]
}

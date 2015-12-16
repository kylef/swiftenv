#!/usr/bin/env bats

load helpers

@test "shows the current set local version" {
  echo "testl-5.0.0" > "$SWIFTENV_HOME/.swift-version"

  run swiftenv local
  [ "$status" -eq 0 ]
  [ "$lines" = "testl-5.0.0" ]
}

@test "allows setting a local version" {
  mkdir -p "$SWIFTENV_ROOT/versions/testls-6.0.0"
  run swiftenv local testls-6.0.0

  [ "$status" -eq 0 ]
  [ "$(cat "$SWIFTENV_HOME/.swift-version")" = "testls-6.0.0" ]
}

#!/usr/bin/env bats

load helpers

@test "shows the current set global version" {
  echo "testg-5.0.0" > "$SWIFTENV_ROOT/version"

  run swiftenv global
  [ "$status" -eq 0 ]
  [ "$lines" = "testg-5.0.0" ]
}

@test "allows setting a global version" {
  mkdir -p "$SWIFTENV_ROOT/versions/testgs-6.0.0"
  run swiftenv global testgs-6.0.0

  [ "$status" -eq 0 ]
  [ "$(cat "$SWIFTENV_ROOT/version")" = "testgs-6.0.0" ]
}

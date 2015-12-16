#!/usr/bin/env bats

load helpers

@test "invoking with an unknown version errors" {
  run swiftenv prefix unknown-1.0.0
  [ "$status" -eq 1 ]
  [ "$lines" = "unknown-1.0.0 is not installed" ]
}

@test "invoking with known version inside 'SWIFTENV_ROOT/versions'" {
  mkdir -p "$SWIFTENV_ROOT/versions/known-1.2.0"
  run swiftenv prefix known-1.2.0
  [ "$status" -eq 0 ]
  [ "$lines" = "$SWIFTENV_ROOT/versions/known-1.2.0" ]
}

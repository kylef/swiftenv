#!/usr/bin/env bats

load helpers

@test "shows the available versions" {
  mkdir -p "$SWIFTENV_ROOT/versions/a" "$SWIFTENV_ROOT/versions/b" "$SWIFTENV_ROOT/versions/c"

  run swiftenv versions
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "* system" ]
  [ "${lines[1]}" = "  a" ]
  [ "${lines[2]}" = "  b" ]
  [ "${lines[3]}" = "  c" ]
}

@test "indicates the selected version, and why" {
  mkdir -p "$SWIFTENV_ROOT/versions/a" "$SWIFTENV_ROOT/versions/b" "$SWIFTENV_ROOT/versions/c"
  echo "b" > "$SWIFTENV_ROOT/version"

  run swiftenv versions
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "  a" ]
  [ "${lines[1]}" = "* b (set by $SWIFTENV_ROOT/version)" ]
  [ "${lines[2]}" = "  c" ]
}

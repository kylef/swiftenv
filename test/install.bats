#!/usr/bin/env bats

load helpers

@test "invoking with an installed version" {
  mkdir -p "$SWIFTENV_ROOT/versions/1.0.0"
  run swiftenv install 1.0.0
  [ "$status" -eq 1 ]
  [ "$lines" = "1.0.0 is already installed." ]
}

@test "invoking with an installed version with skip existing" {
  mkdir -p "$SWIFTENV_ROOT/versions/1.0.0"
  run swiftenv install -s 1.0.0
  [ "$status" -eq 0 ]
  [ "$lines" = "1.0.0 is already installed." ]
}

@test "invoking with the --build option and a version that doesn't have a build profile" {
  run swiftenv install --build 1.0.0
  [ "$status" -eq 1 ]
  [ "$lines" = "We don't have build instructions for 1.0.0." ]
}

@test "invoking with the --build option and a URL as the version" {
  run swiftenv install --build https://swiftenv.fuller.li/test
  [ "$status" -eq 1 ]
  [ "$lines" = 'The given URL must be to a binary version of Swift, you cannot use the `--build` option with a URL.' ]
}

@test "invoking with the --list option" {
  run swiftenv install --list
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "2.2-dev" ]
  [ "${lines[1]}" = "2.2" ]
  [ "${lines[2]}" = "2.2.1" ]
  [ "${lines[3]}" = "3.0-dev" ]
}


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

@test "invoking with the -l option as a short option of install --list" {
  run swiftenv install -l
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "2.2-dev" ]
  [ "${lines[1]}" = "2.2" ]
  [ "${lines[2]}" = "2.2.1" ]
  [ "${lines[3]}" = "3.0-dev" ]
}

@test "invoking with an installed version with skip existing saves global version" {
  mkdir -p "$SWIFTENV_ROOT/versions/1.0.0"
  run swiftenv install -s 1.0.0
  [ "$status" -eq 0 ]
  [ "$lines" = "1.0.0 is already installed." ]
  [ "$(cat $SWIFTENV_ROOT/version)" = "1.0.0" ]
}

@test "invoking with an installed version with skip existing disable global version" {
  mkdir -p "$SWIFTENV_ROOT/versions/1.0.0"
  run swiftenv install --no-set-global -s 1.0.0
  [ "$status" -eq 0 ]
  [ "$lines" = "1.0.0 is already installed." ]
  [ ! -r "$SWIFTENV_ROOT/version" ]
}

@test "invoking with an installed version with skip existing and set local version" {
  mkdir -p "$SWIFTENV_ROOT/versions/1.0.0"
  run swiftenv install --set-local -s 1.0.0
  [ "$status" -eq 0 ]
  [ "$lines" = "1.0.0 is already installed." ]
  [ ! -r "$SWIFTENV_ROOT/version" ]
  [ "$(cat .swift-version)" = "1.0.0" ]
}

@test "invoking with an installed version with skip existing and set global and local version" {
  mkdir -p "$SWIFTENV_ROOT/versions/1.0.0"
  run swiftenv install --set-local --set-global -s 1.0.0
  [ "$status" -eq 0 ]
  [ "$lines" = "1.0.0 is already installed." ]
  [ "$(cat $SWIFTENV_ROOT/version)" = "1.0.0" ]
  [ "$(cat .swift-version)" = "1.0.0" ]
}

@test "invoking with an installed version with local version doesnt set global" {
  echo '1.0.0' > .swift-version
  mkdir -p "$SWIFTENV_ROOT/versions/1.0.0"
  run swiftenv install -s
  [ "$status" -eq 0 ]
  [ "$lines" = "1.0.0 is already installed." ]
  [ ! -r "$SWIFTENV_ROOT/version" ]
}

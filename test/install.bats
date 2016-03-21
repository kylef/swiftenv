#!/usr/bin/env bats

load helpers

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


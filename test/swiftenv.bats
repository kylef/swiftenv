#!/usr/bin/env bats

@test "invoking without any arguments returns help" {
  run swiftenv
  [ "$status" -eq 1 ]
  [ "${lines[0]}" = "Usage: swiftenv [--version] <command>" ]
}

@test "invoking with '--version' returns the version" {
  run swiftenv --version
  [ "$status" -eq 0 ]
  [[ "$lines" = "swiftenv "* ]]
}

@test "invoking with '--help' returns the help" {
  run swiftenv --help
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "Usage: swiftenv [--version] <command>" ]
}

@test "invoking with an unknown command errors" {
  run swiftenv unknown-command
  [ "$status" -eq 1 ]
  [ "$lines" = "no such command \`unknown-command'" ]
}

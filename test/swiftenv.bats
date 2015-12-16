#!/usr/bin/env bats

@test "invoking without any arguments returns help" {
  run swiftenv
  [ "$status" -eq 1 ]
  [ "${lines[0]}" = "Usage: swiftenv [--version] <command>" ]
}

@test "invoking with '--version' returns the version" {
  run swiftenv --version
  [[ "${lines[0]}" = "swiftenv "* ]]
}

@test "invoking with '--help' returns the help" {
  run swiftenv --help
  [ "${lines[0]}" = "Usage: swiftenv [--version] <command>" ]
}

@test "invoking with an unknown command errors" {
  run swiftenv unknown-command
  [ "$status" -eq 1 ]
  [ "${lines[0]}" = "no such command \`unknown-command'" ]
}

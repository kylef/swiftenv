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

@test "invoking with command and '--help' returns the help for given command" {
  run swiftenv version --help
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "Usage: swiftenv version" ]
}

@test "invoking with command that has a man page and '--help' shows the man page" {
  if [ "$CI" ]; then
    skip
  fi

  run swiftenv install --help
  [ "$status" -eq 0 ]
  [[ "${lines[0]}" = "SWIFTENV-INSTALL(1)"* ]]
}

@test "invoking with an unknown command errors" {
  run swiftenv unknown-command
  [ "$status" -eq 1 ]
  [ "$lines" = "no such command \`unknown-command'" ]
}

@test "invoking with an unknown command and '--help' errors" {
  run swiftenv x --help
  [ "$status" -eq 1 ]
  [ "$lines" = "swiftenv: no such command 'x'" ]
}

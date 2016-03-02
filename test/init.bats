#!/usr/bin/env bats

load helpers

@test "adds shims to PATH for fish" {
  run swiftenv init - fish
  [ "$status" -eq 0 ]
  [ "$lines" = "setenv PATH '$SWIFTENV_ROOT/shims' \$PATH" ]
}

@test "adds shims to PATH for bash" {
  run swiftenv init - bash
  [ "$status" -eq 0 ]
  [ "$lines" = "export PATH=\"$SWIFTENV_ROOT/shims:\${PATH}\"" ]
}

@test "adds shims to PATH for zsh" {
  run swiftenv init - bash
  [ "$status" -eq 0 ]
  [ "$lines" = "export PATH=\"$SWIFTENV_ROOT/shims:\${PATH}\"" ]
}

@test "adds rehash by default if shims do not exist" {
  run swiftenv init - bash
  [ "$status" -eq 0 ]
  [ "${lines[1]}" = "command swiftenv rehash 2>/dev/null" ]
}

if [[ "$(uname -s)" == "Darwin" ]]; then
  @test "does not add rehash by default if shims do exist" {
    mkdir -p "$SWIFTENV_ROOT/shims"
    run swiftenv init - bash
    [ "$status" -eq 0 ]
    [ "${lines[2]}" = "" ]
  }
else
  @test "rehash is enabled by default, even when shims do exist" {
    mkdir -p "$SWIFTENV_ROOT/shims"
    run swiftenv init - bash
    [ "$status" -eq 0 ]
    [ "${lines[1]}" = "command swiftenv rehash 2>/dev/null" ]
  }
fi

@test "adds rehash when you pass --rehash" {
  mkdir -p "$SWIFTENV_ROOT/shims"
  run swiftenv init - bash --rehash
  [ "$status" -eq 0 ]
  [ "${lines[1]}" = "command swiftenv rehash 2>/dev/null" ]
}

@test "does not add rehash when you pass --no-rehash" {
  run swiftenv init - bash --no-rehash
  [ "$status" -eq 0 ]
  [ "${lines[1]}" = "" ]
}

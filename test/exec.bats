#!/usr/bin/env bats

load helpers

@test "executes the given binary" {
  binpath="$SWIFTENV_ROOT/versions/known-1.2.0/usr/bin"
  mkdir -p "$binpath"
  echo "#!/usr/bin/env bash" > "$binpath/swift"
  echo "echo 'hello world'" >> "$binpath/swift"
  chmod +x "$binpath/swift"
  export SWIFT_VERSION=known-1.2.0

  run swiftenv exec swift
  [ "$status" -eq 0 ]
  [ "$lines" = "hello world" ]
}

@test "exits with the subprocesses exit code" {
  binpath="$SWIFTENV_ROOT/versions/known-1.2.0/usr/bin"
  mkdir -p "$binpath"
  echo "#!/usr/bin/env bash" > "$binpath/swift"
  echo "echo 'hello world'" >> "$binpath/swift"
  echo "exit 5" >> "$binpath/swift"
  chmod +x "$binpath/swift"
  export SWIFT_VERSION=known-1.2.0

  run swiftenv exec swift
  [ "$status" -eq 5 ]
  [ "$lines" = "hello world" ]
}


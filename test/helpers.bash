export SWIFTENV_ROOT="$BATS_TMPDIR/swiftenv/root"
export SWIFTENV_HOME="$BATS_TMPDIR/swiftenv/home"

setup() {
  mkdir -p "$SWIFTENV_ROOT"
  mkdir -p "$SWIFTENV_HOME"
  cd "$SWIFTENV_HOME"
}

teardown() {
  rm -fr "$SWIFTENV_ROOT" "$SWIFTENV_HOME"
}

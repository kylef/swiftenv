export SWIFTENV_ROOT="$BATS_TMPDIR/swiftenv/root"

teardown() {
  rm -fr "$SWIFTENV_ROOT"
}

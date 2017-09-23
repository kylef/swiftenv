#!/usr/bin/env bats

@test "can install a Swift 3.1.1 from source" {
  version="3.1.1"
  run swiftenv install --build "$version"
  [ "$status" -eq 0 ]
}

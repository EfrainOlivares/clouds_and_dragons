#!/usr/bin/env bats

@test "print help file 1" {
      run cnd
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "usage: cnd action object flags" ]
}

@test "print help file 2" {
      run cnd
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "usage: cnd action object flags" ]
}

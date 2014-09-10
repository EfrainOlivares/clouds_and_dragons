#!/usr/bin/env bats

@test "print help file 1" {
      run bundle exec cnd
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "usage: cnd action object flags" ]
}

@test "print help file 2" {
      run bundle exec cnd
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "usage: cnd action object flags" ]
}

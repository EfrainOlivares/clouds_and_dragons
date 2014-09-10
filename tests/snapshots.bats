#!/usr/bin/env bats

@test "list snapshots 1" {
      run bundle exec cnd list snapshots
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "Snapshots:" ]
}

@test "list snapshots 2" {
      run bundle exec cnd list snapshots --name="lopaka"
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "Snapshots:" ]
}

@test "list snapshots 3" {
      run bundle exec cnd list snapshots --name="lopakas_volume" tags --name="date"
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "Snapshots:" ]
}

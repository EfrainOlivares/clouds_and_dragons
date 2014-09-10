#!/usr/bin/env bats

@test "list deployments 1" {
      run bundle exec cnd list deployments
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "Deployments:" ]
      [ "${lines[1]}" = "Default" ]
      [ "${lines[1]}" = "CA" ]
}

@test "list deployments 2" {
      run bundle exec cnd list deployments --name="moo:shard93"
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "Deployments:" ]
      [ "${lines[1]}" = "moo-shard93" ]
}

@test "list deployments 3" {
      run bundle exec cnd list deployments --name="93"
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "Deployments:" ]
      [ "${lines[1]}" = "moo:localring93" ]
      [ "${lines[2]}" = "moo:shard93" ]
      [ "${lines[3]}" = "moo:uns93" ]
}

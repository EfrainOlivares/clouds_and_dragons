#!/usr/bin/env bats

@test "list servers 1" {
      run bundle exec cnd list deployments servers
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "Servers:" ]
      [ "${lines[1]}" = "opsCenterTest" ] 
}

@test "list servers 2" {
      run bundle exec cnd list servers --name="moo93-stats"
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "Servers:" ]
      [ "${lines[1]}" = "moo93-stats.test.rightscale.com" ]
}

@test "list servers 3" {
      run bundle exec cnd list servers --name="db"
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "Servers:" ]
      [ "${lines[1]}" = "uns-db94-1.test.rightscale.com" ]
}

@test "list servers 4" {
      run bundle exec cnd list deployments --name="moo:Shard93" servers --name="db"
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "Servers:" ]
      [ "${lines[1]}" = "mongodb93-1.test.rightscale.com" ]
}

@test "list servers 5" {
      run bundle exec cnd list servers --name="db" deployments --name="moo:Shard93"
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "Servers:" ]
      [ "${lines[1]}" = "mongodb93-1.test.rightscale.com" ]
}

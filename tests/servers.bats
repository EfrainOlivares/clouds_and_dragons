#!/usr/bin/env bats

@test "list servers 1" {
      skip "feature coming"
      run bundle exec cnd list deployments servers
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "Servers:" ]
      [ "${lines[1]}" = "opsCenterTest" ] 
}

@test "list servers 2" {
      skip "feature coming"
      run bundle exec cnd list servers --name="moo93-stats"
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "Servers:" ]
      [ "${lines[1]}" = "moo93-stats.test.rightscale.com" ]
}

@test "list servers 3" {
      skip "feature coming"
      run bundle exec cnd list servers --name="db"
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "Servers:" ]
      [ "${lines[1]}" = "uns-db94-1.test.rightscale.com" ]
}

@test "list servers 4" {
      skip "feature coming"
      run bundle exec cnd list deployments --name="moo:Shard93" servers --name="db"
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "Servers:" ]
      [ "${lines[1]}" = "mongodb93-1.test.rightscale.com" ]
}

@test "list servers 5" {
      skip "feature coming"
      run bundle exec cnd list servers --name="db" deployments --name="moo:Shard93"
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "Servers:" ]
      [ "${lines[1]}" = "mongodb93-1.test.rightscale.com" ]
}

@test "list servers" {
      run bundle exec cnd list servers
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "Mephisto v5" ]
      [ "${lines[1]}" = "/api/servers/37842" ]
}



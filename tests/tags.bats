#!/usr/bin/env bats

@test "list server tags 1" {
      run bundle exec cnd list servers --name="moo-93" tags
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "Tags:" ]
      [ "${lines[1]}" = "ec2:Name=moo-93.test.rightscale.com" ]
      [ "${lines[2]}" = "info:api_id=15372569003" ]      
}

@test "list server tags 2" {
      run bundle exec cnd list deployments --name="moo:shard93" servers --name="moo-93" tags
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "Tags:" ]
      [ "${lines[1]}" = "ec2:Name=moo-93.test.rightscale.com" ]
      [ "${lines[2]}" = "info:api_id=15372569003" ]      
}

@test "list server tags 3" {
      run bundle exec cnd list deployments --name="moo:shard93" servers --name="moo-93" tag --name="branch"
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "Tags:" ]
      [ "${lines[1]}" = "Error: server moo-93.test.rightscale.com has no tags named branch" ]
}

@test "list server tags 4" {
      run bundle exec cnd list deployments --name="moo:shard93" servers --name="moo93-stats" tag --name="branch"
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "Tags:" ]
      [ "${lines[1]}" = "branch:right_site=release_candidate5.3" ]
}

@test "list deployment tags 1" {
      run bundle exec cnd list deployments --name="moo:shard93" tags
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "Tags:" ]
      [ "${lines[1]}" = "Error: deployment moo:shard93 has no tags" ]
}

@test "list deployment tags 2" {
      run bundle exec cnd list deployments --name="moo:shard93" tags --name="branch"
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "Tags:" ]
      [ "${lines[1]}" = "rror: deployment moo:shard93 has no tags named branch" ]
}

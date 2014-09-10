#!/usr/bin/env bats

@test "list server inputs 1" {
      run bundle exec cnd list servers --name="moo-93" --inputs
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "Inputs:" ]
      [ "${lines[1]}" = "MAINTENANCE_CONTENTS => text:maintenance.html" ]
}

@test "list server inputs 2" {
      run bundle exec cnd list servers --name="moo-93" --inputs --inputs-next
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "Inputs:" ]
      [ "${lines[1]}" = "MAINTENANCE_CONTENTS => text:maintenance.html" ]
}

@test "list server inputs 3" {
      run bundle exec cnd list deployments --name="moo:shard93" servers --name="moo-93" inputs
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "Inputs:" ]
      [ "${lines[1]}" = "MAINTENANCE_CONTENTS => text:maintenance.html" ]
}

@test "list server inputs 4" {
      run bundle exec cnd list deployments --name="moo:shard93" servers --name="moo-93" inputs --name="branch"
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "Inputs:" ]
      [ "${lines[1]}" = "Error: server moo-93.test.rightscale.com has no inputs named branch" ]
}

@test "list server inputs 5" {
      run bundle exec cnd list deployments --name="moo:shard93" servers --name="moo93-stats" inputs --name="branch"
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "Inputs:" ]
      [ "${lines[1]}" = "APP_RIGHTSITE_BRANCH -> text:release_candidate5.3" ]
      [ "${lines[2]}" = "ST_AUDITOR_BRANCH -> text:release_candidate5.3" ]
}

@test "list server inputs 6" {
      run bundle exec cnd list deployments --name="moo:shard93" servers --name="moo93-stats" inputs-next --name="branch"
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "Inputs:" ]
      [ "${lines[1]}" = "APP_RIGHTSITE_BRANCH -> text:release_candidate5.3" ]
      [ "${lines[2]}" = "ST_AUDITOR_BRANCH -> text:release_candidate5.3" ]
}

@test "list deployment inputs 1" {
      run bundle exec cnd list deployments --name="moo:shard93" inputs
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "Inputs:" ]
      [ "${lines[1]}" = "APPLICATION -> multiple" ]
}

@test "list deployment inputs 2" {
      run bundle exec cnd list deployments --name="moo:shard93" inputs --name="branch"
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "Inputs:" ]
      [ "${lines[1]}" = "APP_BRANCH -> text:release_candidate5.3" ]
      [ "${lines[2]}" = "APP_AUDITOR_BRANCH -> text:release_candidate5.3" ]
      [ "${lines[3]}" = "APP_CLOUDWORKFLOW_BRANCH -> text:master" ]
}

@test "list deployment inputs 3" {
      run bundle exec cnd list deployments --name="moo:shard93" inputs-next --name="branch"
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "Inputs:" ]
      [ "${lines[1]}" = "APP_BRANCH -> text:release_candidate5.3" ]
      [ "${lines[2]}" = "APP_AUDITOR_BRANCH -> text:release_candidate5.3" ]
      [ "${lines[3]}" = "APP_CLOUDWORKFLOW_BRANCH -> text:master" ]
}

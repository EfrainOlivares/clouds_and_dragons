#!/usr/bin/env bats

@test "list volumes 1" {
      run bundle exec cnd list volumes
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "Volumes" ]
      [ "${lines[1]}" = "Lopaka" ]
}

@test "list volumes 2" {
      run bundle exec cnd list volumes --name="lopaka"
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "Volumes" ]
      [ "${lines[1]}" = "Lopaka" ]
}

@test "list volumes 3" {
      run bundle exec cnd list volumes --name="lopaka" tags --name="lopaka"
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "Volumes" ]
      [ "${lines[1]}" = "Lopaka" ]
}

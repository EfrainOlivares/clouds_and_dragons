#!/usr/bin/env bats

@test "list deployments" {
      run bundle exec cnd list deployments
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "Default" ]
      [ "${lines[1]}" = "/api/deployments/3151" ]
      [ "${lines[2]}" = "Single Server Deployments" ]
}

@test "list deployments --name='dnc_test_dep_1' servers --name='base_server_dnc_test_1'" {
      echo "this"
      run bundle exec cnd list deployments --name="dnc_test_dep_1" servers --name="base_server_dnc_test_1"
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "base_server_dnc_test_1" ]
      [ "${lines[1]}" = "/api/servers/1037019004" ]
}

@test "list deployments --name='dnc_test_dep_1'" {
      run bundle exec cnd list deployments --name="dnc_test_dep_1"
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "dnc_test_dep_1" ]
      [ "${lines[1]}" = "/api/deployments/483829004" ]
}

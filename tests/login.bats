#!/usr/bin/env bats

@test "add login" {
      run bundle exec cnd add login --name="stage" --username="gregcoit" --password="junk" --api_endpoint="us3.rightscale.com" --id="3"
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "stage account created" ]
}
		
@test "list login" {
      run bundle exec cnd list login
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "Logins:" ]
      [ "${lines[1]}" = "minimoo" ]
      [ "${lines[2]}" = "stage" ]
      [ "${lines[3]}" = "production" ]
}

@test "modify login" {
      run bundle exec cnd modify login --name="stage" --username="gregcoit" --password="junk" --api_endpoint="us3.rightscale.com" --id="3"
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "stage account modified" ]
}

@test "set login" {
      run bundle exec cnd set login --name="stage"
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "stage account set as active" ]
}

@test "delete login" {
      run bundle exec cnd delete login --name="stage"
      [ "$status" -eq 0 ]
      [ "${lines[0]}" == "stage account deleted" ]
}

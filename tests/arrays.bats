#!/usr/bin/env bats

@test "list arrays 1" {
      run cnd list deployments arrays
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "Arrays:" ]
      [ "${lines[1]}" = "AcctOverviewUI93 (Includes workers)" ]
}

@test "list arrays 2" {
      run cnd list arrays
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "Arrays:" ]
      [ "${lines[1]}" = "AcctOverviewUI93 (Includes workers)" ]
}

@test "list arrays 3" {
      run cnd list arrays --name="Core"
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "Arrays:" ]}
      [ "${lines[1]}" = "Core93" ]}
      [ "${lines[2]}" = "Core94" ]}

@test "list arrays 4" {
      run cnd list deployments arrays --name="Core93"
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "Arrays:" ]
      [ "${lines[1]}" = "Core93" ]}
}

@test "list arrays 5" {
      run cnd list arrays --name="Core93"
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "Arrays:" ]
      [ "${lines[1]}" = "Core93" ]}
}

@test "list arrays 6" {
      run cnd list deployments --name="moo:shard93" arrays
      [ "$status" -eq 0 ]
      [ "${lines[0]}" = "Arrays:" ]
      [ "${lines[1]}" = "AcctOverviewUI93 (Includes workers)" ]
}
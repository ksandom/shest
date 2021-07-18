#!/bin/bash
# Create a project.

. "$SHEST_SCRIPT" "--doNothing"

result="$("$SHEST_SCRIPT" --createProject 2>&1)"
exitCode=$?

expect_exitCode 0
expect_exists "shest/unit/myFirstStage/exampleTest.sh" "A dummy test in a stage should be created."
expect_exists "shest/config/general" "Default config should be created."
expect_resultContains "Excellent."

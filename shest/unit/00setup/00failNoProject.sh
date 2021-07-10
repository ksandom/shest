#!/bin/bash
# Shest should fail if a project has not been set up.

. "$SHEST_SCRIPT" "--doNothing"

testingShest

result="$("$SHEST_SCRIPT" 2>&1)"
exitCode=$?

expect_exitCode 1
expect_value 'It looks like shest has not been initialised' "${result::44}"

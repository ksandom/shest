#!/bin/bash
# Write a decription of the test here.

. "$SHEST_SCRIPT" "--doNothing"

result="$(echo "blah")"
exitCode=$?

expect_not_resultContains "wheee"

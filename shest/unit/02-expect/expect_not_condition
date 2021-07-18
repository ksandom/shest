#!/bin/bash
# Write a decription of the test here.

. "$SHEST_SCRIPT" "--doNothing"

result="$(true)"
exitCode=$?

expect_not_condition 2 -gt 2
expect_not_condition 2 -lt 2
expect_not_condition 2 -eq 3
expect_not_condition "thing" == "blah"
expect_not_condition "thing" '!=' "thing"
expect_not_condition 2 -gt 2 "With a custom message."

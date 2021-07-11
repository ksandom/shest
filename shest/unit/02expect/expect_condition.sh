#!/bin/bash
# Write a decription of the test here.

. "$SHEST_SCRIPT" "--doNothing"

result="$(true)"
exitCode=$?

expect_condition 2 -gt 1
expect_condition 2 -lt 3
expect_condition 2 -eq 2
expect_condition "thing" == "thing"
expect_condition "thing" '!=' "blah"
expect_condition 2 -gt 1 "With a custom message."

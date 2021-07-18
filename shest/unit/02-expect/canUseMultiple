#!/bin/bash
# Write a decription of the test here.

. "$SHEST_SCRIPT" "--doNothing"

result="$(true)"
exitCode=$?

expect_value 0 0
expect_exitCode 0
expect_not_value 0 1
expect_not_exitCode 1

#!/bin/bash
# Write a decription of the test here.

. "$SHEST_SCRIPT" "--doNothing"

result="$(shest --listExpects)"
exitCode=$?

expect_exitCode 0
expect_resultContains expect_exitCode
expect_resultContains expect_not_value

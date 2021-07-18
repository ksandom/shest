#!/bin/bash
# Write a decription of the test here.

. "$SHEST_SCRIPT" "--doNothing"

result="$(true)"
exitCode=$?

expect_not_fileContains "$0" "bla[h]"

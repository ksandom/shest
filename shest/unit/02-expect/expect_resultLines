#!/bin/bash
# Write a decription of the test here.

. "$SHEST_SCRIPT" "--doNothing"

result="$(echo -e "blah\nwheee")"
exitCode=$?

expect_resultLines 2

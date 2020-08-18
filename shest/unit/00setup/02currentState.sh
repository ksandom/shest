#!/bin/bash
# Run the tests so far. It should fail.

. "$SHEST_SCRIPT" "--doNothing"

result="$("$SHEST_SCRIPT")"
exitCode=$?


if [ ! "$exitCode" == 1 ]; then
    fail "Exit code was not 1. =$exitCode"
else
    pass "Great!"
fi

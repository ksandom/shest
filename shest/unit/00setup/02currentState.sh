#!/bin/bash
# Run the tests so far. It should fail.

. "$SHEST_SCRIPT" "--doNothing"

beginNestedShest

# Do the work.
result="$("$SHEST_SCRIPT")"
exitCode=$?

endNestedShest

if [ ! "$exitCode" == 1 ]; then
    fail "Exit code was not 1. =$exitCode"
else
    pass "Great!"
fi

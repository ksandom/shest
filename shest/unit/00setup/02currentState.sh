#!/bin/bash
# Run the tests so far. It should fail.

. "$SHEST_SCRIPT" "--doNothing"

beginNestedShest

# Do the work.
result="$("$SHEST_SCRIPT")"
exitCode=$?

endNestedShest

expect_exitCode 1

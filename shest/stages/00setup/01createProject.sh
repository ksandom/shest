#!/bin/bash
# Create a project.

. "$SHEST_SCRIPT" "--doNothing"

result="$("$SHEST_SCRIPT" --createProject 2>&1)"
exitCode=$?

if [ "${result::10}" == 'Excellent.' ] && [ "$exitCode" == "0" ] ; then
    pass "Great!"
elif [ "$exitCode" == "1" ]; then
    fail "Got exitCode $exitCode. Value=\"$result\"."
else
    fail "Got value=\"$result\" and exit code=$exitCode."
fi

#!/bin/bash
# Shest should fail if a project has not been set up.

. "$SHEST_SCRIPT" "--doNothing"
testingShest

result="$("$SHEST_SCRIPT" 2>&1)"
exitCode=$?

if [ "${result::44}" == 'It looks like shest has not been initialised' ] && [ "$exitCode" == "1" ] ; then
    pass "Great!"
elif [ "$exitCode" == "0" ]; then
    fail "Got exitCode $exitCode. Value=\"$result\"."
else
    fail "Got value=\"$result\". Test=\"${result::43}\" Code=$exitCode Fail=$failCode."
fi


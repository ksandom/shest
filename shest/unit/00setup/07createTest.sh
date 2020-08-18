#!/bin/bash
# Write a decription of the test here.

. "$SHEST_SCRIPT" "--doNothing"

result="$("$SHEST_SCRIPT" placeholder)"
exitCode=$?


# NOTE that passCode, warnCode, and failCode are not set for you since they may be different depending on what you are testing. Therefore you should either set these values, or replace them with what is meaningful for you.
if [ "$result" == 'something expected' ] && [ "$exitCode" == "$passCode" ] ; then
    pass "Great!"
elif [ "$result" == 'something good, but might be a problem' ]  && [ "$exitCode" == "$warnCode" ] ; then
    warn "This is within range, but could be a problem. value=\"$result\"."
elif [ "$exitCode" == "$failCode" ]; then
    fail "Got exitCode $exitCode. Value=\"$result\"."
else
    fail "Got value=\"$result\" and exit code=$exitCode."
fi


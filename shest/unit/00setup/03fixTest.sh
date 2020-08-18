#!/bin/bash
# Fix the broken test. And run the test again. It should succeed.

. "$SHEST_SCRIPT" "--doNothing"

sed -i 's#doSomething#true#g; s#^if.*then#if [ "$exitCode" == 0 ]; then#g' shest/unit/myFirstStage/exampleTest.sh
result="$("$SHEST_SCRIPT")"
exitCode=$?


if [ ! "$exitCode" == 0 ]; then
    fail "Exit code was not 0. =$exitCode"
else
    pass "Great!"
fi

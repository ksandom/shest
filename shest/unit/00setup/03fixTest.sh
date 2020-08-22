#!/bin/bash
# Fix the broken test. And run the test again. It should succeed.

. "$SHEST_SCRIPT" "--doNothing"

beginNestedShest

# Do the fix.
sed -i 's#doSomething#true#g; s#^if.*then#if [ "$exitCode" == 0 ]; then#g' shest/unit/myFirstStage/exampleTest.sh

# Do the work.
"$SHEST_SCRIPT"
exitCode=$?

endNestedShest

if [ ! "$exitCode" == 0 ]; then
    fail "Exit code was not 0. =$exitCode"
    touch /tmp/failed
else
    pass "Great!"
    touch /tmp/passed
fi

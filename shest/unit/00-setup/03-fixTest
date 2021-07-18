#!/bin/bash
# Fix the broken test. And run the test again. It should succeed.

. "$SHEST_SCRIPT" "--doNothing"

beginNestedShest

# Do the fix.
sed -i 's#doSomething#true#g; s#^if.*then#if [ "$exitCode" == 0 ]; then#g' shest/unit/myFirstStage/exampleTest.sh

# Do the work.
result="$SHEST_SCRIPT"
exitCode=$?

endNestedShest

expect_exitCode 0

#!/bin/bash
# Create a project.

. "$SHEST_SCRIPT" "--doNothing"

result="$("$SHEST_SCRIPT" --createProject 2>&1)"
exitCode=$?

if [ ! -e "shest/unit/myFirstStage/exampleTest.sh" ]; then
    fail "A stage and dummy test should have been created."
elif [ ! -e "shest/config/general" ]; then
    fail "Default config should have been created."
elif [ "$exitCode" == "1" ]; then
    fail "Got exitCode $exitCode. Value=\"$result\"."
elif [ "${result::10}" == 'Excellent.' ] && [ "$exitCode" == "0" ] ; then
    pass "Great!"
else
    fail "Got value=\"$result\" and exit code=$exitCode."
fi

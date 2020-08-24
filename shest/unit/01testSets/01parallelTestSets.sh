#!/bin/bash
# Test that the tests in a testSet are running in parallel. (They should be.) While tests outside of a test set should not be running in parallel.

. "$SHEST_SCRIPT" "--doNothing"

# Logic:
# Each test will artificially take at least $interval seconds. And there are 9 tests. If they are running one at a time, they will take more than 9x$interval seconds. If they are running in parallel, they could be as fast as $interval seconds total. Although on slow computers, it's possible they could take longer. Therefore we want to allow a margin of error. Therefore, over how many seconds should we consider a fail? Note that duration is measured in integer seconds. Therefore $moreThanSecondsIsFail must be an integer.
if [ "$fastTests" == 'true' ]; then
    moreThanSecondsIsFail="2"
    interval="0.3"
else
    moreThanSecondsIsFail="7"
    interval="1"
fi

beginNestedShest

# Remove extra testSets so that we don't take longer than we really need to.
rm -Rf shest/unit/testSets/0{1,2}testSet

# Add an artificial delay to the tests.
for testFile in $(find -iname '*.sh'); do
    echo "sleep $interval" >> "$testFile"
done

# Add more parallel tests


# Do the work.
startTime="$(date +%s)"
"$SHEST_SCRIPT"
exitCode=$?
stopTime="$(date +%s)"
let duration=$stopTime-$startTime

endNestedShest

if [ ! "$exitCode" == 0 ]; then
    fail "Exit code was not 0. =$exitCode"
elif [ "$duration" -gt "$moreThanSecondsIsFail" ]; then
    fail "The tests took too long ($duration>$moreThanSecondsIsFail). This implies that the testSet tests are not running in parallel. OR Your computer is really, REALLY slow."
else
    pass "Great! duration=$duration moreThanSecondsIsFail=$moreThanSecondsIsFail."
fi

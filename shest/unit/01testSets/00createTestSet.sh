#!/bin/bash
# Set up some testSets with some tests.

. "$SHEST_SCRIPT" "--doNothing"

beginNestedShest

# Populate with some testSets and tests.
mkdir -p shest/unit/testSets/0{0,1,2}testSet
cp shest/unit/myFirstStage/exampleTest.sh shest/unit/testSets/00testSet/00test.sh
cp shest/unit/myFirstStage/exampleTest.sh shest/unit/testSets/00testSet/01test.sh
cp shest/unit/myFirstStage/exampleTest.sh shest/unit/testSets/00testSet/02test.sh
cp shest/unit/myFirstStage/exampleTest.sh shest/unit/testSets/00testSet/03test.sh
cp shest/unit/myFirstStage/exampleTest.sh shest/unit/testSets/00testSet/04test.sh
cp shest/unit/myFirstStage/exampleTest.sh shest/unit/testSets/00testSet/05test.sh
cp shest/unit/myFirstStage/exampleTest.sh shest/unit/testSets/00testSet/06test.sh
cp shest/unit/myFirstStage/exampleTest.sh shest/unit/testSets/00testSet/07test.sh
cp shest/unit/myFirstStage/exampleTest.sh shest/unit/testSets/00testSet/08test.sh

cp shest/unit/testSets/00testSet/* shest/unit/testSets/01testSet
cp shest/unit/testSets/00testSet/* shest/unit/testSets/02testSet

# Trim out the previous test so it doesn't pollute the results.
rm -Rf shest/unit/myFirstStage

# Do the work.
"$SHEST_SCRIPT"
exitCode=$?

# How many tests did we run? - This is using the assumptions that there is only our
numberOfTests="$(wc -l shest/tmp/results.csv.inside | awk '{print $1}')"

endNestedShest

if [ ! "$exitCode" == 0 ]; then
    fail "Exit code was not 0. =$exitCode"
elif [ "$numberOfTests" != 27 ]; then
    fail "Ran the wrong number of tests ($numberOfTests). Expected 27."
else
    pass "Great!"
fi
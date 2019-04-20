#!/bin/sh
# Test vulture-feeder
#
echo "TESTING vulture-feeder:"
ACTUAL_RESULT=source_doc.py.new

for TEST in *_test.txt; do
  rm -f $ACTUAL_RESULT
  base=${TEST%_test.txt}
  expected=${base}_expected.txt
  printf "   • %-13s : " ${base#vulture_}
  cat $TEST | ../vulture-feeder > /dev/null
  if diff "${expected}" $ACTUAL_RESULT > /dev/null; then
    echo "[PASS]"
  else
    echo "[FAIL] "
    echo "     ERROR: Test results '$ACTUAL_RESULT' do not match expected result in '${expected}':"
    diff ${expected} $ACTUAL_RESULT
    break
  fi
done
#!/bin/sh
# Test vulture-feeder
#
# USAGE:   ./_run_tests.sh
#
# STATUS:  Currently failing vulture_delete_fifth_expected.txt
# AUTHOR:  Jonathan Cross 0xC0C076132FFA7695 (jonathancross.com)
# LICENSE: WTFPL
#          https://github.com/jonathancross/vulture-feeder/blob/master/LICENSE
################################################################################
echo "TESTING vulture-feeder:"
RESULT_FILE=source_doc.py.new

for TEST in *_test.txt; do
  # Cleanup result file if lingering from before...
  [ -f "${RESULT_FILE}" ] && rm -f "${RESULT_FILE}"
  base="${TEST%_test.txt}"
  expected_file="${base}_expected.txt"
  printf "   • %-13s : " "${base#vulture_}"
  cat "${TEST}" | ../vulture-feeder > /dev/null
  if diff "${expected_file}" "${RESULT_FILE}" > /dev/null; then
    echo "[PASS]"
  else
    echo "[FAIL] - Test results do not match expected result:"
    diff "${expected_file}" "${RESULT_FILE}"
    # Cleanup results...
    rm -f "${RESULT_FILE}"
    echo "-------------------------------------------------"
    echo "You can reproduce this diff by running:"
    echo "cat ${TEST} | ../vulture-feeder > /dev/null; diff ${expected_file} ${RESULT_FILE}"
    break
  fi
done

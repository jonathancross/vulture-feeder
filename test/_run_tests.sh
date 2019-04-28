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
COLOR_DEFAULT='\033[m\033[40m'
COLOR_GREEN='\033[32m\033[40m'
COLOR_GREY='\033[37m\033[40m'
COLOR_RED='\033[31m\033[40m'
RESULT_FILE=source_doc.py.new

echo 'TESTING vulture-feeder:'

for TEST in *_test.txt; do
  # Cleanup result file if lingering from before...
  [ -f "${RESULT_FILE}" ] && rm -f "${RESULT_FILE}"
  base="${TEST%_test.txt}"
  expected_file="${base}_expected.txt"
  printf "   • %-16s : " "${base#vulture_}"
  cat "${TEST}" | ../vulture-feeder > /dev/null
  if diff "${expected_file}" "${RESULT_FILE}" > /dev/null; then
    echo "${COLOR_GREEN}[PASS]${COLOR_DEFAULT}"
  else
    echo "${COLOR_RED}[FAIL]${COLOR_DEFAULT}"' - Test results do not match expected result:'
    diff "${expected_file}" "${RESULT_FILE}"
    # Cleanup results...
    rm -f "${RESULT_FILE}"
    echo '-------------------------------------------------'
    echo 'You can reproduce this diff by running:'
    echo "cat ${TEST} | ../vulture-feeder > /dev/null; diff ${expected_file} ${RESULT_FILE}"
    echo '-------------------------------------------------'
  fi
done

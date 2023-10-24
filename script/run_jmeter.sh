#!/bin/bash

# Function to run JMeter tests
run_jmeter_test() {
  local num_requests=$1
  # local iterations=$2
  local jmx_file=$2

  echo "Running JMeter tests with $num_requests requests"

  docker run -v "$(pwd)/jmeter:/jmeter" -v "$(pwd)/results:/results" \
    --name jmeter -it --rm --network host \
    -e numofreq=$num_requests \
    justb4/jmeter -n -t /jmeter/$jmx_file -l /results/test_${num_requests}.jtl

  echo "JMeter tests with $num_requests requests completed."
}

# # Check if the number of arguments is correct
# if [ "$#" -ne 1 ]; then
#   echo "Usage: $0 <num_requests>"
#   exit 1
# fi

# # The first command-line argument is the number of requests
# num_requests=$1

# Run JMeter tests with different configurations using $num_requests
run_jmeter_test 10 test.jmx
# run_jmeter_test $num_requests 20 test.jmx
# run_jmeter_test $num_requests 30 test.jmx

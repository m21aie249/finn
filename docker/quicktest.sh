#!/bin/bash

: ${PYTEST_PARALLEL=auto}

cd $FINN_ROOT
# check if command line argument is empty or not present
if [ -z $1 ]; then
  echo "Running quicktest: not (vivado or slow or board) with pytest-xdist"
  pytest -m 'not (vivado or slow or vitis or board or notebooks or bnn_pynq)' --dist=loadfile -n $PYTEST_PARALLEL
elif [ $1 = "main" ]; then
  echo "Running main test suite: not (rtlsim or end2end) with pytest-xdist"
  pytest -k 'not (rtlsim or end2end)' --dist=loadfile -n $PYTEST_PARALLEL
elif [ $1 = "rtlsim" ]; then
  echo "Running rtlsim test suite with pytest-parallel"
  pytest -k rtlsim --workers $PYTEST_PARALLEL
elif [ $1 = "end2end" ]; then
  echo "Running end2end test suite with no parallelism"
  pytest -k end2end
elif [ $1 = "bnn_pynq" ]; then
  echo "Running bnn_pynq test suite with no parallelism"
  pytest -k bnn_pynq
elif [ $1 = "slow" ]; then
  echo "Running slow test suite with no parallelism"
  pytest -k slow
elif [ $1 = "vitis" ]; then
  echo "Running vitis test suite with no parallelism"
  pytest -k vitis
elif [ $1 = "vivado" ]; then
  echo "Running vivado test suite with no parallelism"
  pytest -k vivado
elif [ $1 = "util" ]; then
  echo "Running util test suite with no parallelism"
  pytest -k util
elif [ $1 = "fpgadataflow" ]; then
  echo "Running fpgadataflow test suite with no parallelism"
  pytest -k fpgadataflow
elif [ $1 = "full" ]; then
  echo "Running full test suite, each step with appropriate parallelism"
  $0 main;
  $0 rtlsim;
  $0 end2end;
  $0 bnn_pynq;
  $0 slow;
  $0 vitis
  $0 vivado
  $0 util
  $0 fpgadataflow
else
  echo "Unrecognized argument to quicktest.sh"
fi

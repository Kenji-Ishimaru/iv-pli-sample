#!/bin/sh

TOP_MODULE=test_module
# RTL directory
RTL_DIR="../rtl"

# check iverilog is installed
command -v iverilog >/dev/null 2>&1
AVL=$?
if [ ${AVL} -ne 0 ]; then
  echo "iverilog is not installed.  Aborting."
  exit 1
fi

# PLI header file directory
INC_DIR="/usr/local/include/iverilog"

if [ ! -d ${INC_DIR} ]; then
  echo "iverilog include directory is not found. Aborting."
  exit 1
fi


# PLI compile
CFLAGS="-fPIC -Wall -I${INC_DIR}"
LFLAGS="-G -shared -export-dynamic"
if [ ! -e my_pli.so ]; then
  echo "PLI compile"
  gcc ${CFLAGS} -c ../pli/my_pli.c
  ld ${LFLAGS} my_pli.o ${LFLAGS} -o my_pli.so
fi

sim_file=$1

# compile verilog
iverilog -c ../bin/cmd.txt \
  -v \
  -y ${RTL_DIR} \
  -o ${TOP_MODULE} \
  ${sim_file}

# run vvp
vvp \
  -mcadpli \
  ${TOP_MODULE} \
  -cadpli=./my_pli.so:my_bootstrap

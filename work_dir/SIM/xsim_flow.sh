#!/bin/bash
GUI=
if [ "$1" == "waves" ]; then 
        GUI=--gui
fi
SOURCES_SV=" \
    ../SRC/adder.sv \
    ../SRC/subtractor.sv \
    ../SRC/tb.sv \
"
COMP_OPTS_SV=" \
    --incr \
    --relax
"
DEFINES_SV=" -d SUBTRACTOR_VHDL "
SOURCES_VHDL=" ../SRC/subtractor.vhdl "
COMP_OPTS_VHDL=" --incr --relax "

echo
echo "### COMPILING SYSTEMVERILOG ###"
xvlog --sv $COMP_OPTS_SV $DEFINES_SV $SOURCES_SV
if [ $? -ne 0 ]; then
    echo "### SYSTEMVERILOG COMPILATION FAILED ###"
    exit 10 
fi

echo
echo "### COMPILING VHDL ###"
xvhdl $COMP_OPTS_VHDL $SOURCES_VHDL
if [ $? -ne 0 ]; then
    echo "### VHDL COMPILATION FAILED ###"
    exit 11
fi

echo
echo "### ELABORATING ###"
xelab -debug all -top tb -snapshot adder_tb_snapshot
if [ $? -ne 0 ]; then
    echo "### VHDL COMPILATION FAILED ###"
    exit 12
fi

echo
echo "### RUNNING SIMULATION ###"
xsim adder_tb_snapshot -R $GUI

exit 0

# vivado-scripted-flow

#### Tutorial series on Vivado Simulator Scripted Flow (Bash, Makefiles)
* [Part I - Basic Vivado command-line tool usage](https://www.itsembedded.com/dhd/vivado_sim_1/)
* [Part II - Introduction to Bash scripting with Vivado tools](https://www.itsembedded.com/dhd/vivado_sim_2/)
* [Part III - Vivado Simulator flow using Makefiles](https://www.itsembedded.com/dhd/vivado_sim_3/)
* Part IV - IP core and Block Design integration into scripted flow (coming soon)


What you'll find in this repository:

* **work_dir/SRC** <- VHDL/SystemVerilog source files
* **work_dir/SRC/adder.sv** <- Example adder written in SystemVerilog
* **work_dir/SRC/subtractor.sv** <- Example subtractor written in SystemVerilog
* **work_dir/SRC/subtractor.vhdl** <- Example subtractor written in VHDL
* **work_dir/SRC/tb.sv** Example testbench for verifying above three modules
* **work_dir/SIM/** <- Directory for running simulations
* **work_dir/SIM/xsim_flow.sh** <- Scripted flow using `Bash`
* **work_dir/SIM/Makefile** <- Makefile for scripted flow using `make`
* **work_dir/SIM/xsim_cfg.tcl** <- Configuration TCL file for Vivado Simulator to dump waves, run all and exit.


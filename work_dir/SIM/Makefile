SOURCES_SV := \
    ../SRC/adder.sv \
    ../SRC/subtractor.sv \
    ../SRC/tb.sv \

COMP_OPTS_SV := \
    --incr \
    --relax \

DEFINES_SV :=
SOURCES_VHDL := ../SRC/subtractor.vhdl
COMP_OPTS_VHDL := --incr --relax

TB_TOP := tb

ADDER ?= VHDL
ifeq ($(ADDER), VHDL)
  $(info Building with VHDL adder)
  DEFINES_SV := $(DEFINES_SV) -d SUBTRACTOR_VHDL
else ifeq ($(ADDER), SV)
  $(info Building with SYSTEMVERILOG adder)
  DEFINES_SV := $(DEFINES_SV) -d SUBTRACTOR_SV
else
  $(info )
  $(info BAD ADDER TYPE)
  $(info Available options:)
  $(info make ADDER=VHDL <target>)
  $(info make ADDER=SV <target>)
  $(error )
endif

#==== Default target - running simulation without drawing waveforms ====#
.PHONY : simulate
simulate : $(TB_TOP)_snapshot.wdb

.PHONY : elaborate
elaborate : .elab.timestamp

.PHONY : compile
compile : .comp_sv.timestamp .comp_v.timestamp .comp_vhdl.timestamp

#==== WAVEFORM DRAWING ====#
.PHONY : waves
waves : $(TB_TOP)_snapshot.wdb
	@echo
	@echo "### OPENING WAVES ###"
	xsim --gui $(TB_TOP)_snapshot.wdb

#==== SIMULATION ====#
$(TB_TOP)_snapshot.wdb : .elab.timestamp
	@echo
	@echo "### RUNNING SIMULATION ###"
	xsim $(TB_TOP)_snapshot -R

#==== ELABORATION ====#
.elab.timestamp : .comp_sv.timestamp .comp_v.timestamp .comp_vhdl.timestamp
	@echo
	@echo "### ELABORATING ###"
	xelab -debug all -top $(TB_TOP) -snapshot $(TB_TOP)_snapshot
	touch .elab.timestamp

#==== COMPILING SYSTEMVERILOG ====#
ifeq ($(SOURCES_SV),)
.comp_sv.timestamp :
	@echo
	@echo "### NO SYSTEMVERILOG SOURCES GIVEN ###"
	@echo "### SKIPPED SYSTEMVERILOG COMPILATION ###"
    touch .comp_sv.timestamp
else
.comp_sv.timestamp : $(SOURCES_SV) .adder_$(ADDER).timestamp
	@echo
	@echo "### COMPILING SYSTEMVERILOG ###"
	xvlog --sv $(COMP_OPTS_SV) $(DEFINES_SV) $(SOURCES_SV)
	touch .comp_sv.timestamp
endif

#==== COMPILING VERILOG ====#
ifeq ($(SOURCES_V),)
.comp_v.timestamp :
	@echo
	@echo "### NO VERILOG SOURCES GIVEN ###"
	@echo "### SKIPPED VERILOG COMPILATION ###"
	touch .comp_v.timestamp
else
.comp_v.timestamp : $(SOURCES_V)
	@echo
	@echo "### COMPILING VERILOG ###"
	xvlog $(COMP_OPTS_V) $(DEFINES_V) $(SOURCES_V)
	touch .comp_v.timestamp
endif

#==== COMPILING VHDL ====#
ifeq ($(SOURCES_VHDL),)
.comp_vhdl.timestamp :
	@echo
	@echo "### NO VHDL SOURCES GIVEN ###"
	@echo "### SKIPPED VHDL COMPILATION ###"
	touch .comp_vhdl.timestamp
else
.comp_vhdl.timestamp : $(SOURCES_VHDL)
	@echo
	@echo "### COMPILING VHDL ###"
	xvhdl $(COMP_OPTS_VHDL) $(SOURCES_VHDL)
	touch .comp_vhdl.timestamp
endif

.PHONY : clean
clean :
	rm -rf *.jou *.log *.pb *.wdb xsim.dir
	rm -rf .*.timestamp

#==== Adder version marker generation ===#
.adder_$(ADDER).timestamp :
	@rm -rf .adder_*.timestamp
	@touch .adder_$(ADDER).timestamp

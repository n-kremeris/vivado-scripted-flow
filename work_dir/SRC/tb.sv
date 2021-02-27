// Basic SystemVerilog mixed SV-VHDL testbench
// Copyright Norbertas Kremeris 2021
// www.itsembedded.com

module tb ();
    logic [31:0] a, b, sum; // for the adder
    logic [31:0] x, y, sub; // for the subtractor

    adder DUT_adder(.*); //instantiate the amazing adder

    `ifdef SUBTRACTOR_VHDL
        subtractor_vhdl DUT_subtractor
        (   // wildcard (.*) connection not supported in XSIM for VHDL
            .x(x),
            .y(y),
            .sub(sub)
        );
    `elsif SUBTRACTOR_SV
        subtractor_systemverilog DUT_subtractor(.*);
    `else
        $fatal(1, "Subtractor DUT not selected, please define SUBTRACTOR_VHDL or SUBTRACTOR_SV");
    `endif

    initial begin
        `ifdef SUBTRACTOR_VHDL
            $display("$$$ TESTBENCH: Using VHDL subtractor");
        `elsif SUBTRACTOR_SV
            $display("$$$ TESTBENCH: Using SystemVerilog subtractor");
        `endif

        #1;
    	a = 1;
    	b = 2;
        x = 9;
        y = 3;
    	#1;
    	assert (sum == 3) else
    	    $fatal(1, "Adder failed");
        assert (sub == 6) else
            $fatal(1, "Subtractor failed");

    	$display("TB passed, adder and subtractor ready to use in production");
    end
endmodule : tb

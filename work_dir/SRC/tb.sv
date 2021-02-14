// tb.sv
// Module Description: testbench for the adder

module tb ();
    logic [31:0] a, b, sum;

    adder DUT(.*); //instantiate the amazing adder

    initial begin
        a = 1;
        b = 2;
        #1;
        assert (sum == 3) else // Unless something went really wrong in the universe, we'd expect that 1+2=3
            $fatal(1, "Well if we cant add 1 and 2 to get 3 then we really screwed something up");
        $display("TB passed, adder ready to use in production");
    end
endmodule : tb

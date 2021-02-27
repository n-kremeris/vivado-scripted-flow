// SystemVerilog basic subtractor
// Copyright Norbertas Kremeris 2021
// www.itsembedded.com

module subtractor_systemverilog (
    input logic  [31:0] x,
    input logic  [31:0] y,
    output logic [31:0] sub
);
    logic [31:0] y_comp2;
    always_comb begin
        y_comp2 = ~y + 32'b1;
        sub = x + y_comp2;
    end
    initial begin
        $display("Subtractor initial block, hell yeah!");
    end
endmodule : subtractor_systemverilog

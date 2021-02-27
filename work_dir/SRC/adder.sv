// adder.sv
// Module Description: superefficient ultraoptimized adder
// Copyright Norbert Kremeris 2021
// www.itsembedded.com

module adder (
    input logic [31:0] a,
    input logic [31:0] b,
    output logic [31:0] sum
);

    always_comb begin
        sum = a + b;
    end

endmodule : adder

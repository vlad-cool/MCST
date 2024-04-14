module half_adder (
    input l,
    input r,
    output res,
    output car
);

assign res = l ^ r;
assign car = l & r;

endmodule

module increment
#(
    parameter WIDTH = 32
)
(
    input [WIDTH-1:0]a,
    input b,
    output [WIDTH-1:0]res
);

wire c[WIDTH:0];
assign c[0] = b;

genvar i;
generate
    for (i = 0; i < WIDTH; i = i + 1) begin : gen_counters
        half_adder adder_inst(.l(a[i]), .r(c[i]), .res(res[i]), .car(c[i+1])); 
    end
endgenerate

endmodule

module half_remover (
    input l,
    input r,
    output res,
    output car
);

assign res = l ^ r;
assign car = ~l & r;

endmodule

module decrement
#(
    parameter WIDTH = 32
)
(
    input [WIDTH-1:0]a,
    input b,
    output [WIDTH-1:0]res
);

wire c[WIDTH:0];
assign c[0] = b;

genvar i;
generate
    for (i = 0; i < WIDTH; i = i + 1) begin : gen_counters
        half_remover remover_inst(.l(a[i]), .r(c[i]), .res(res[i]), .car(c[i+1])); 
    end
endgenerate

endmodule
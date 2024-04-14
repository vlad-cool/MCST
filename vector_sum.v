// parameter DATA_W = 10;
// parameter POS_W = 4

module half_adder (
    input a,
    input b,
    output sum,
    output carry_out
);

assign sum = a ^ b;
assign carry_out = a & b;

endmodule

module counter
#(
    parameter POS_W = 4
)
(
    input [POS_W-1:0]a,
    input b,
    output [POS_W-1:0]sum
);

wire c[POS_W:0];
assign c[0] = b;

genvar i;
generate
    for (i = 0; i < POS_W; i = i + 1) begin : gen_counters
        half_adder adder_inst(.a(a[i]), .b(c[i]), .sum(sum[i]), .carry_out(c[i+1])); 
    end
endgenerate

endmodule

module vector_sum 
#(
    parameter DATA_W=10,
    parameter POS_W = $clog2(DATA_W) + ($clog2(DATA_W) != $clog2(DATA_W))
)
(
    input [DATA_W-1:0]data,
    output [POS_W-1:0]sum
);

wire [POS_W-1:0] intermediate[DATA_W:0];

assign intermediate[0] = 'b0;
assign sum = intermediate[DATA_W - 1];

genvar i;
generate
    for (i = 0; i < DATA_W; i = i + 1) begin : gen_counters
        counter #(POS_W) counter_inst (.a(intermediate[i]), .b(data[i]), .sum(intermediate[i + 1]));
    end
endgenerate

endmodule


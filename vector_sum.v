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
assign sum = intermediate[DATA_W];

genvar i;
generate
    for (i = 0; i < DATA_W; i = i + 1) begin : gen_counters
        increment #(.WIDTH(POS_W)) counter_inst (.a(intermediate[i]), .b(data[i]), .res(intermediate[i + 1]));
    end
endgenerate

endmodule


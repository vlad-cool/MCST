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

module counter (
    input [3:0]a,
    input b,
    output [3:0]sum
);

wire c0, c1, c2, c3;

half_adder adder_0(.a(a[0]), .b(b ), .sum(sum[0]), .carry_out(c0)); 
half_adder adder_1(.a(a[1]), .b(c0), .sum(sum[1]), .carry_out(c1)); 
half_adder adder_2(.a(a[2]), .b(c1), .sum(sum[2]), .carry_out(c2)); 
half_adder adder_3(.a(a[3]), .b(c2), .sum(sum[3]), .carry_out(c3)); 

endmodule

module vector_sum (
    input [9:0]data,
    output [3:0]sum
);

wire [3:0] sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7, sum8, sum9;

assign sum0 = 4'b0000;

counter counter0(.a(sum0), .b(data[0]), .sum(sum1));
counter counter1(.a(sum1), .b(data[1]), .sum(sum2));
counter counter2(.a(sum2), .b(data[2]), .sum(sum3));
counter counter3(.a(sum3), .b(data[3]), .sum(sum4));
counter counter4(.a(sum4), .b(data[4]), .sum(sum5));
counter counter5(.a(sum5), .b(data[5]), .sum(sum6));
counter counter6(.a(sum6), .b(data[6]), .sum(sum7));
counter counter7(.a(sum7), .b(data[7]), .sum(sum8));
counter counter8(.a(sum8), .b(data[8]), .sum(sum9));
counter counter9(.a(sum9), .b(data[9]), .sum(sum));

endmodule


module testbench;

reg [15:0] input_data;
wire [15:0] output_inc;
wire [15:0] output_dec;

increment #(16) tested_inc (
    .a(input_data),
    .b(1'b1),
    .res(output_inc)
);

decrement #(16) tested_dec (
    .a(input_data),
    .b(1'b1),
    .res(output_dec)
);

initial begin
    input_data <= 16'b0101011010101100;
    #1
    $display("Input:  %b", input_data);
    $display("Output: %b", output_inc);
    $display("Output: %b", output_dec);
    $display("#####################");

    input_data <= 16'b111111111111111;
    #1
    $display("Input:  %b", input_data);
    $display("Output: %b", output_inc);
    $display("Output: %b", output_dec);
    $display("#####################");

    input_data <= 16'b010100010000000;
    #1
    $display("Input:  %b", input_data);
    $display("Output: %b", output_inc);
    $display("Output: %b", output_dec);
    $display("#####################");
    
    input_data <= 16'b0000000000000000;
    #1
    $display("Input:  %b", input_data);
    $display("Output: %b", output_inc);
    $display("Output: %b", output_dec);
    $display("#####################");
    
    input_data <= 16'b1010000110101111;
    #1
    $display("Input:  %b", input_data);
    $display("Output: %b", output_inc);
    $display("Output: %b", output_dec);
    $display("#####################");

    $finish;
end

endmodule
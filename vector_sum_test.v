module testbench;

reg [31:0] input_data;
wire [17:0] output_data;

vector_sum #(.DATA_W(32), .POS_W(18)) tested_module (
    .data(input_data),
    .sum(output_data)
);

initial begin
    input_data <= 32'b01010110101011100000111111110000;
    #1
    $display("Input: %b", input_data);
    $display("Output: %b", output_data);

    input_data <= 32'b11111111111111111111111111111111;
    #1
    $display("Input: %b", input_data);
    $display("Output: %b", output_data);

    input_data <= 32'b01111111111111111111111111111111;
    #1
    $display("Input: %b", input_data);
    $display("Output: %b", output_data);
    
    input_data <= 32'b00000000000000000000000000000000;
    #1
    $display("Input: %b", input_data);
    $display("Output: %b", output_data);
    
    input_data <= 32'b10100001101001011000111001101000;
    #1
    $display("Input: %b", input_data);
    $display("Output: %b", output_data);

    $finish;
end

endmodule
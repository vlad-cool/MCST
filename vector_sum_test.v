module testbench;

reg [17:0] input_data;
wire [10:0] output_data;

vector_sum #(.DATA_W(18), .POS_W(11)) tested_module (
    .data(input_data),
    .sum(output_data)
);

initial begin
    input_data <= 32'b0101011010101110000011111111;
    #1
    $display("Input: %b", input_data);
    $display("Output: %b", output_data);
    $finish;
end

endmodule
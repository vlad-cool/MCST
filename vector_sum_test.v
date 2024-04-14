module testbench;

reg [9:0] input_data;
wire [3:0] output_data;

vector_sum tested_module (
    .data(input_data),
    .sum(output_data)
);

initial begin
    input_data <= 10'b1010101010;
    #1
    $display("Input: %b", input_data);
    $display("Output: %b", output_data);
    $finish;
  end

endmodule
module testbench;

reg clk = 1'b0;

always begin
    #1 clk = ~clk;
end

reg read;
reg write;

reg [3:0] addr;
reg [9:0] data_in;

wire [9:0] data_out;
wire val;
wire full;

lifo tested_module(
    .write(write),
    .datain(data_in),
    .read(read),
    .clk(clk),
    .reset(1'b0),
    .dataout(data_out),
    .val(val),
    .full(full)
);

initial begin
    write = 1;

    data_in = 10'b0000000001;
    #2
    $display("data_out: %b", data_out);
    $display("val:      %b", val);
    $display("full:     %b", full);

    data_in = 10'b0000000010;
    #2
    $display("data_out: %b", data_out);
    $display("val:      %b", val);
    $display("full:     %b", full);
    $display("full:     %b", full);
    
    data_in = 10'b0000000100;
    #2
    $display("data_out: %b", data_out);
    $display("val:      %b", val);
    $display("full:     %b", full);
    
    data_in = 10'b0000000100;
    #2
    $display("data_out: %b", data_out);
    $display("val:      %b", val);
    $display("full:     %b", full);
    
    data_in = 10'b0000000100;
    #2
    $display("data_out: %b", data_out);
    $display("val:      %b", val);
    $display("full:     %b", full);
    
    data_in = 10'b0000000100;
    #2
    $display("data_out: %b", data_out);
    $display("val:      %b", val);
    $display("full:     %b", full);
    
    data_in = 10'b0000000100;
    #2
    $display("data_out: %b", data_out);
    $display("val:      %b", val);
    $display("full:     %b", full);

    write = 0;
    read = 1;

    $display("READING");

    #2
    $display("data_out: %b", data_out);
    $display("val:      %b", val);
    $display("full:     %b", full);

    #2
    $display("data_out: %b", data_out);
    $display("val:      %b", val);
    $display("full:     %b", full);

    #2
    $display("data_out: %b", data_out);
    $display("val:      %b", val);
    $display("full:     %b", full);

    read = 'b1;
    write = 'b1;
    data_in = 10'b0101101011;

    #2
    $display("data_out: %b", data_out);
    $display("val:      %b", val);
    $display("full:     %b", full);
    
    #100 $finish;
end

endmodule
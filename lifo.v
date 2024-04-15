module lifo 
#(
    parameter LIFO_SIZE=6,
    parameter DATA_W=10
)
(
    input write,
    input [DATA_W-1:0]datain,
    input read,
    input clk,
    input reset,
    output [DATA_W-1:0]dataout,
    output val,
    output full
);

reg [$clog2(DATA_W) + ($clog2(DATA_W) != $clog2(DATA_W))-1:0] addr = 'b0;
reg [DATA_W-1:0] data;
reg [31:0] mem [LIFO_SIZE-1:0];
assign dataout = data;
assign full = addr == LIFO_SIZE;
assign val = ptr == 0;

always @ (posedge clk) begin
    if (reset) begin
        ptr = 0;
    end
    if (read & write) begin
        data <= datain;
    end
    else if (write) begin
        mem[addr] <= datain;
        addr <= addr + 1;
        data <= datain;
    end
    else if (read) begin
        addr <= addr - 1;
        data <= mem[addr - 1];
    end
end

endmodule

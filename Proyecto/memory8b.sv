module memory8b(
    input wire clk, rw,
    input wire [7:0] data_in,
    input wire [7:0] add,
    output reg [7:0] data_out,

    output reg [7:0] data_out_tb
);

    reg [7:0] memory [256];

    always@(posedge clk)
        begin
            if (rw) begin
                data_out = memory[add];
            end
            else begin
                memory [add] = data_in; 
            end
        end


endmodule
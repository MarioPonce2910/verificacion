module memory16b(
    output reg [15:0] data_out,
    input wire [15:0] address,
    input wire [15:0] data_in, 
    input wire write_enable,
    input wire clk
);
    reg [15:0] memory [65536];

    always @(posedge clk) begin
        if (write_enable) begin
            memory[address] <= data_in;
        end
        data_out <= memory[address];
    end

endmodule
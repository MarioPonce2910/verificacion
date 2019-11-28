module memory8b(
    output reg [7:0] data_out,
    input wire [7:0] address,
    input wire [7:0] data_in, 
    input wire write_enable,
    input wire clk
);
    reg [7:0] memory [256];

    always @(posedge clk) begin
        if (write_enable) begin
            memory[address] <= data_in;
        end
        data_out <= memory[address];
    end

endmodule
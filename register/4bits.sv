module register(
    input wire clk,reset,load,
    input wire [3:0] data_in,

    output reg fn = 0,
    output reg tx = 0,
    output reg [4:0] counter = 0
);

endmodule 
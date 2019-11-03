module register(
    input wire clk, rst, wr, enable,
    input wire [7:0] add,
    input wire [7:0] data_in,
    output reg [7:0] data_out
);

    reg [7:0] register [255:0];
    reg [7:0] add_in;

always@(posedge clk)
    begin
        if (enable) begin
            if (wr) begin
                register[add] <= data_in;
            end
            add_in <= add;
        end
    end

    assign data_out = register[add_in];
endmodule 
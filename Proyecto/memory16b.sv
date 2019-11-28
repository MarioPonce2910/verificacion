module memory16b(
    input wire clk, rw,
    input wire [15:0] data_in,
    input wire [15:0] add,
    output reg [15:0] data_out,


    output reg [15:0] add_test,
    output reg [15:0] data_in_test,
    output reg  rw_tb
);

    reg [15:0] memory [65536];
    

    always@(posedge clk)
        begin
            if (rw) begin
                // data_out = memory[add];
                data_out = memory[add];
                add_test = add;
                data_in_test = data_in;
            end
        end
    always@(posedge clk)
        begin
            rw_tb = rw;
            if (!rw) begin
                memory[add] = data_in;
            end
        end
endmodule
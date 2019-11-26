module memory16b(
    input wire clk, rw,
    input [15:0] data_in,
    input [15:0] add,
    output [15:0] data out
);

    reg [15:0] memory [65536];

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

module memory16b(
    input wire clk, rw,
    input [15:0] data_in,
    input [15:0] add,
    output [15:0] data out
);

    reg [15:0] memory [65536];

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

module memory(
    input wire clk, rst, enable,
    input wire [15:0] add,
    output reg st_end,

    output reg [7:0] write_tb,
    output reg [7:0] add_tb,
    output reg [2:0] fsm_tb
);

    reg [15:0] read [65536];
    reg [7:0] write [256];

    reg [15:0] data = 0;
    reg [7:0] data_8b1 = 0;
    reg [7:0] data_8b2 = 0;

    reg [2:0] st_fsm = 0;


    assign read [0] = 16'h0000;
    assign read [1] = 16'h0001;
    assign read [2] = 16'h0002;
    assign read [3] = 16'h0003;
    assign read [4] = 16'h0004;
    assign read [5] = 16'h0005;
    assign read [6] = 16'h0006;
    assign read [7] = 16'h0007;
    assign read [8] = 16'h0008;
    assign read [9] = 16'h0009;
    assign read [10] = 16'h000a;
    assign read [11] = 16'h000b;
    assign read [12] = 16'h000c;
    assign read [13] = 16'h000d;
    assign read [14] = 16'h000e;
    assign read [15] = 16'h000f;
    assign read [16] = 16'h000f;

always@(*)
    begin
        if(rst == 1) begin
            st_fsm = 0;
            data = 0;
            data_8b1 = 0;
            data_8b2 = 0;
        end
    end

always@(posedge clk)
    begin
        if (enable) begin
            if (st_fsm == 0) begin
               data = read[add];
               st_end = 0;
               st_fsm = 0;
               fsm_tb = st_fsm;
            end
            if (st_fsm == 1) begin
               data_8b1 = data[15:8];
               data_8b2 = data[7:0];

               st_fsm = 2;
               fsm_tb = st_fsm;
            end
            if (st_fsm == 2) begin
               write[data_8b1] = data_8b2;
               write_tb = data_8b2;
               add_tb = data_8b1;
               st_fsm = 0;
               st_end = 1;
               fsm_tb = st_fsm;
               data=0;
            end
            else begin
                st_fsm = 0;
                fsm_tb = st_fsm;
            end
        end
    end
endmodule 
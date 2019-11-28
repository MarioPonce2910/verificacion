

module memory8b(
    input wire clk, rw,
    input wire [7:0] data_in,
    input wire [7:0] add,
    output reg [7:0] data_out
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

module memory(
    input wire clk, rst, enable,
    input wire [15:0] add,
    output reg st_end,

    output reg [7:0] write_tb,
    output reg [7:0] add_tb,
    output reg [2:0] fsm_tb
);

    reg [15:0] data = 0;
    reg [15:0] dataread;
    reg [7:0] data_8b1 = 0;
    reg [7:0] data_8b2 = 0;
    reg rw16b = 0;
    reg rw8b = 0;

    reg [2:0] st_fsm = 0;

    memory16b memory16b(
        .clk(clk),
        .add(add),
        .rw(rw16b),
        .data_out(dataread)
    );
    memory8b memory8b(
        .clk(clk),
        .add(data_8b1),
        .rw(rw8b),
        .data_in(data_8b2)
    );


    

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
               st_fsm = 0;
               rw16b = 1;
               rw8b = 0;
               data = dataread;
               st_end = 0;
               fsm_tb = st_fsm;
            end
            if (st_fsm == 1) begin
               data_8b1 = data[15:8];
               data_8b2 = data[7:0];

               rw16b = 1;
               rw8b = 0;

               st_fsm = 0;
               fsm_tb = st_fsm;
            end
            // if (st_fsm == 2) begin
            //    data_8b1 = data_8b2;
            //    data_8b2 = data_8b2;

            //    16brw = 1;
            //    8brw = 0;


            //    add_tb = data_8b1;
            //    st_fsm = 0;
            //    st_end = 1;
            //    fsm_tb = st_fsm;
            //    data=0;
            // end
            else begin
                st_fsm = 0;
                fsm_tb = st_fsm;
            end
        end
    end
endmodule 
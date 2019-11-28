module memory(
    input wire [15:0] address,
    input wire [15:0] data_in, 
    input wire clk,
    input wire enable,

    output reg [15:0] data_out,
    
    output reg [7:0] data_write_8b,
    output reg [7:0] data_addres_8b
);

    reg [2:0] st = 0;
    reg write_enable16b;
    reg write_enable8b;
    reg [7:0]address8b;
    reg [7:0]data_in8b;
    reg [15:0]data_out16b;
    reg [7:0]data_out8b;
    

    memory16b memory16b(
        .data_out(data_out16b),
        .address(address),
        .data_in(data_in), 
        .write_enable(write_enable16b),
        .clk(clk)
    );
    memory8b memory8b(
        .data_out(data_out8b),
        .address(address8b),
        .data_in(data_in8b), 
        .write_enable(write_enable8b),
        .clk(clk)
    );
    always @(posedge clk) begin
        if (enable) begin
            if (st == 0) begin
                write_enable16b = 0;
                st=1;
            end
            if (st == 1) begin
                address8b = data_out16b[15:8];
                data_in8b = data_out16b[7:0];
                data_out = data_out16b;
                write_enable8b = 1;
                st = 2;
            end 
            if (st == 2) begin
                data_write_8b = data_in8b;
                data_addres_8b = address8b;
                st = 0;
            end
        end
        if (!enable) begin
            write_enable16b = 1;
        end
    end

endmodule
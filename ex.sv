module exam(
    input wire clk,inv, ce, rest,
    input wire [15:0] data_in,
    output reg [15:0] data_out
);

reg [15:0] data_save;
always@(posedge clk)
    if (rest) begin
           data_out = 0;
           data_save = 0;
    end 
    else
    begin
        if (ce) begin
            data_save = data_in;
            if (data_out == 0) begin
           data_out = 16'bz;
            end
        end
        else    
            begin
                if (inv) begin
                    data_save[7:0] = data_out [15:8];
                    data_save[15:8] = data_out [7:0];
                end
                if (!inv) begin
                    data_save = data_out ;
                end
            end
    end
endmodule 
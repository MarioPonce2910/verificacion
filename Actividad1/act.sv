module sum(op1, op2, sum, aca);
    input [7:0] op1, op2;
    output reg [8:0] sum;
    output reg aca;

    always@*
        begin
            sum = op1 + op2;
            aca = sum[8];
        end
endmodule 
module desp(sum, aca, sel, s_out);
    input [7:0] sum;
    input aca;
    input [1:0] sel;
    output reg [8:0] s_out;

    always@(*)
        begin
            if (sel == 2'b00) begin
                s_out = {aca,sum};
            end
            if (sel == 2'b01) begin
               s_out = {aca,sum[7:1]}; 
            end
            if (sel == 2'b10) begin
               s_out = {aca,sum[7:2]};
            end
            if (sel == 2'b11) begin
               s_out = {5'bzzzzz,aca,sum[7:5]}; 
            end
        end
endmodule
module conect (op1, op2, sel, s_out);
    input [7:0] op1, op2;
    input [1:0] sel;
    output [8:0] s_out;
    wire [7:0] sum;
    wire aca;
    
    sum sum_ins(
        .op1(op1),
        .op2(op2),
        .sum(sum),
        .aca(aca)
    );
    desp desp_ins(
        .sum(sum),
        .aca(aca),
        .sel(sel),
        .s_out(s_out)
    );
endmodule
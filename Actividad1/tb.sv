module conect_tb ();
    reg [7:0] op1, op2;
    reg [1:0] sel;
    wire [8:0] s_out;    

    conect conect_ins(
        .op1(op1),
        .op2(op2),
        .sel(sel),
        .s_out(s_out)
    );

    initial begin
        #100
        op1 = 8'b11111111;
        op2 = 8'b11111111;
        sel = 2'b00;
        #100
        op1 = 8'b11111111;
        op2 = 8'b11111111;
        sel = 2'b01;
        #100
        op1 = 8'b11111111;
        op2 = 8'b11111111;
        sel = 2'b10;
        #100
        op1 = 8'b11111111;
        op2 = 8'b11111111;
        sel = 2'b11;
        #100
        op1 = 8'b11111111;
        op2 = 8'b11111111;
        sel = 2'b11;
        #100
        op1 = 8'b11100111;
        op2 = 8'b11111001;
        sel = 2'b00;
        #100
        op1 = 8'b11100111;
        op2 = 8'b11110011;
        sel = 2'b01;
        #100
        op1 = 8'b11110011;
        op2 = 8'b11001111;
        sel = 2'b10;
        #100
        op1 = 8'b11001111;
        op2 = 8'b11111011;
        sel = 2'b11;
        #100
        op1 = 8'b11111011;
        op2 = 8'b11011111;
        sel = 2'b11;
    end
endmodule
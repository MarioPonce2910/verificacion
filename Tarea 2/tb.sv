module tb_dec();
    reg [3:0] bcd_tb;
    wire [7:0] DEC_tb;

    DECO DECO_INST(
        .bcd(bcd_tb),
        .DEC(DEC_tb)
    );
    initial begin
       #100
       bcd_tb = 4'b0000; 
       #100
       bcd_tb = 4'b0001; 
       #100
       bcd_tb = 4'b0010; 
       #100
       bcd_tb = 4'b0011; 
       #100
       bcd_tb = 4'b0100; 
       #100
       bcd_tb = 4'b0101; 
       #100
       bcd_tb = 4'b0110; 
       #100
       bcd_tb = 4'b0111; 
       #100
       bcd_tb = 4'b1000; 
       #100
       bcd_tb = 4'b1001; 
       #100
       bcd_tb = 4'b1010; 
       #100
       bcd_tb = 4'b1011;
       #100
       bcd_tb = 4'b1100; 
       #100
       bcd_tb = 4'b1101;
       #100
       bcd_tb = 4'b1110; 
       #100
       bcd_tb = 4'b1111;   
    end
endmodule
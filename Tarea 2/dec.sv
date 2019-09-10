module DECO(bcd, DEC); //in this line it is to start the module with inputs and outputs
    input [3:0] bcd;  //this line describe a input signal, the signal have a 4 bits
    output reg [7:0] DEC; //this line describe a output signal, the signal have a 7 bits
    always@(*) // in this line it is start a always block whit all signals
        begin   //this is for start block
            case(bcd) //this line has a case condition
                        //DEC    ABCDEFGP
                4'b0000: //in case of the bcd is 0
                    begin//this is for start block
                        DEC = 8'b00000000;// this line assign 0 to DEC signal
                    end//this is for end block
                4'b0001:
                    begin
                        DEC = 8'b01100000;
                    end
                4'b0010:
                begin
                        DEC = 8'b11011010;
                    end
                4'b0011:
                begin
                        DEC = 8'b11100010;
                    end
                4'b0100:
                begin
                        DEC = 8'b01100110;
                    end
                4'b0101:
                begin
                        DEC = 8'b10111110;
                    end
                4'b0110:
                begin
                        DEC = 8'b00111110;
                    end
                4'b0111:
                begin
                        DEC = 8'b11100000;
                    end
                4'b1000:
                begin
                        DEC = 8'b11111110;
                    end
                4'b1001:
                begin
                        DEC = 8'b11100110;
                    end            
                default: DEC = 8'b00000001; 
            endcase//this is for end case block
        end//this is for end block
endmodule//this is for end module
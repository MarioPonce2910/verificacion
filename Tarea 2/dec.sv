module DECO(bcd, DEC);
    input [3:0] bcd; 
    output reg [7:0] DEC;
    always@(*)
        begin
            case(bcd)
                        //DEC    ABCDEFGP
                4'b0000:
                    begin
                        DEC = 8'b00000000;
                    end
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
            endcase
        end
endmodule
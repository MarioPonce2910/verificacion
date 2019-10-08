module register(
    input wire clk,reset,load,bit0,bit1,bit2,bit3,
    output reg finish = 0,
    output reg tx = 0,
    output reg [2:0] count = 0,
    output reg [3:0] sender = 0
);

    

always@(posedge clk)
    begin
        count = count + 1;
        if (reset) begin
            tx = 0;
            finish = 0;  
            count = 0;          
        end
        if (!reset)
            begin
               if (load) begin
                    finish = 0;
                    count = 0;
                    sender[0] = bit0;
                    sender[1] = bit1;
                    sender[2] = bit2;
                    sender[3] = bit3;
                end 
                if (!load) begin
                        if (count == 1) begin
                            tx = sender[0];
                        end
                        if (count == 2) begin
                            tx = sender[1];
                        end
                        if (count == 3) begin
                            tx = sender[2];
                        end
                        if (count == 4) begin
                            tx = sender[3];
                        end
                        if (count > 4) begin
                            count = 0;
                            finish = 1;
                        end
                        
                        
                        
                        
                end 

            end
    end
endmodule 
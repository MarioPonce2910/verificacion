module register(
    input wire clk,reset,load,
    input wire [3:0] data_in,

    output reg fn = 0,
    output reg tx = 0,
    output reg [4:0] counter = 0
);
reg [4:0] register;
reg [4:0] x = 0;

    

always@(posedge clk)
    begin
        if (reset) begin
            tx = 0;
            fn = 0; 
            x = 0;        
        end
        if (!reset)
            begin
               if (load) begin
                    fn = 0;
                    register[0] <= data_in[0];
                    register[1] <= data_in[1];
                    register[2] <= data_in[2];
                    register[3] <= data_in[3];
                end 
                if (!load) begin
                    x=x+1;
                    if (x==1) begin
                        tx <= register[0];
                        counter = x;
                    end
                    if (x==2) begin
                        tx <= register[1];
                        counter = x;
                    end
                    if (x==3) begin
                        tx <= register[2];
                        counter = x;
                    end
                    if (x==4) begin
                        tx <= register[3];
                        counter = x;
                    end
                    if (x==5) begin
                        x=0;
                        fn = 1;
                        counter = x;
                    end
                end 
            end
    end
endmodule 
module register( //this line is for create a module. 
    input wire clk,reset,st, //is for a input wire
    input wire [3:0] data_in,//is for a input wire
    output reg tx = 0//is for a Outout register
);
reg [1:0] counter = 0; // this is the register for the couter. 
reg [3:0] data_in_register; //this is the register for the data input
reg done = 0; //this register is only a Flag for Done
reg load = 1; //this register is only a Flag for Data Load

always @* //in this always block i describe the done, and change the load flag for one
    begin
        if (done) begin
            load = 1;
        end
    end

always@(posedge clk,posedge reset)//in this always block i describe the function for the module
    begin
        if (reset) begin //this if describe a reset function, send 0 for the next registers
            tx = 0;
            counter = 0;
            load = 0;
        end
        else begin
            if (st) begin //this line describe the st
              if (!load) begin // if load  == 0 the tx output get a array for the data_in
                tx = data_in_register[counter];
                counter = counter + 1;
                if (counter == 3) begin //when the counter == 3 the flag done are 1
                    done = 1;
                end
                end
                if (load) begin // if load == 0 the register of data in get a data in wire after the flag load get 0
                    data_in_register = data_in;
                    load = 0;
                end  
            end
            else begin // else the flag load get 1 and tx get 0. 
                load = 1;
                tx = 0;
            end
        end
    end
endmodule 
module register_tb (); //this module is for the testbeanch 
    reg clk,reset,st;   //the signal for CLK, reset and st wire. 
    reg [3:0] data_in;  //the signal for data in wire
    wire tx; //the signal is for tx register

    register register_ins( //this is for instance the module whit the testbench 
        .clk(clk),
        .reset(reset),
        .st(st),
        .data_in(data_in),
        .tx(tx)
    );
    always // this always block is for describe a clock 
        begin
            #5 clk = !clk; // every 5ms the state of CLK change. 
        end
        initial begin //this initian is for get the empty states 
        clk = 0;
        reset = 1;
        st = 0;
        data_in = 0;
        #5
        reset = 0;
        end
    initial begin //this initial is for describe te test.
    $monitor("clk: %b",clk);
    $monitor("reset: %b",reset);
    $monitor("st: %b",st);
    $monitor("tx: %b",tx);
    $monitor("data_in: %b",data_in);
    $display("Inicio de la simulacion");
       reset = 1'b1; // for the empry i will send a 1 and o on the reset.
       #5
       reset = 1'b0;
       st = 1'b1;
       #5
        data_in[0] = 1; //after the reset, i will be send the values for the data in
        data_in[1] = 1;
        data_in[2] = 1;
        data_in[3] = 0;
       #100 
       st = 1'b1; // after load the datas i send 1 for the st signal. 
       #50
       reset = 1; // finaly send a reset. 

       $display("Final de la simulacion");
    end
endmodule
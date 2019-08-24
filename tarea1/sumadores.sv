module sumador(i1,i2,o1) //this line describe the module, whith the input and output ports
    input [1:0] i1, i2; //this line describe the bit size of the input ports and the type.
    output reg [2:0] o1; //this line describe the bit size of the output ports and the type.

    assign o1 = i1 + i2; //this line assign the add of input i1 and input i2 to output o1

endmodule //this line is for close the module

module sumadorif(i1,i2,o1) //this line describe the module, whith the input and output ports
    input [1:0] i1, i2; //this line describe the bit size of the input ports and the type.
    output reg [2:0] o1; //this line describe the bit size of the output ports and the type.

    always@(*) //this line describe the open always block
        begin // begin of the always block
           if (i1>2'b10) //this line select the number above 2 in the signal i1
            begin  // begin of the if block
                o1 = i1 + i2; //this line assign the add of input i1 and input i2 to output o1    
            end  // end of the if block
            else //else case
                o1 = z; // this line asign z on the o1
        end // end of the always block

    

endmodule //this line is for close the module

module instancia (input [1:0] i1,i2, output [2:0] o1,o2); //this line describe the module, whith the input and output ports
    instancia sumador (.i1(i1),.i2(i2),.o1(o1)); //this line instance the module sumador
    instancia sumadorif (.i1(i1),.i2(i2),.o1(o2));//this line instance the module sumadorif
endmodule //this line is for close the module
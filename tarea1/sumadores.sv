module sumador(i1,i2,o1) //this line describe the module, whith the input and output ports
    input [1:0] i1, i2; //this line describe the bit size of the input ports and the type.
    output reg [2:0] o1; //this line describe the bit size of the output ports and the type.

    assign o1 = i1 + i2; //this line assign the add of input i1 and input i2 to output o1

endmodule //this line is for close the module
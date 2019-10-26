//the next code block describe the inpunts and outputs of the module, the module has a 3 inputs and 1 output. 
//A clock signald, a reset signan adn the in edge signal are the inputs.
//the out edge is the only output signal, everyone are signal of 1 bit. 
module edge_mealy(
    input wire clk,reset,
    input wire in_edge,
    output reg out_edge
);
//the local param is for declare constants. 
localparam 
    zero = 1'b0,
    one = 1'b1;

//and for use the diferents states, we need the next variables.
reg current_st, next_st;
//in the nex always block we was describe a basic CLK signal for change the current state for the next state. 
always@(posedge clk)
    begin
        if (reset) begin
            current_st <= zero;
        end
        else begin
            current_st <= next_st;
        end
    end
//in this always block we was describe a desition for the input signal.
always@(*)
    begin
        next_st = current_st; //this line describe a asignation for the value on the current state to next state
        out_edge = 1'b0; // this line assign 0 on the output

        case(current_st) //this line opened a case for the value on the current state
            zero: //on case current state is on 0 open the next desition
                begin 
                    if (in_edge) begin //  if in edge is on 1 the next state are will on on and the output are will on 1
                        next_st = one;
                        out_edge = 1'b1;
                    end
                    if (in_edge) begin //  if in edge is on 1 the next state are will on on and the output are will on 1
                        next_st = one;
                        out_edge = 1'b1;
                    end
                end
            one: //on case current state is on 1 open the next desition
                begin
                    if (in_edge == 1'b0) begin //  if in edge is on 0 the next state are will on 0
                        next_st = zero;
                    end
                end
            default: // the default value assign zero on the next state.
                begin
                    next_st = zero;
                end
        endcase
    end
endmodule 
//the next code block describe the inpunts and outputs of the module, the module has a 3 inputs and 1 output. 
//A clock signald, a reset signan adn the in edge signal are the inputs.
//the out edge is the only output signal, everyone are signal of 1 bit. 
module edge_moore(
    input wire clk,reset,
    input wire in_edge,
    output reg out_edge
);
//the local param is for declare constants. 
localparam 
    zero = 1'b0,
    one = 1'b1;
//and for use the diferents states, we need the next variables.
reg current_st, next_st;
//in the nex always block we was describe a basic CLK signal for change the current state for the next state. 
always@(posedge clk)
    begin
        if (reset) begin
            current_st <= zero;
        end
        else begin
            current_st <= next_st;
        end
    end
//in this always block, we describe the diferents case of the current state, 
//if the state are on zero, the next state change for one, 
//if the current state are on one, the next state change for zero. 
always@(*)
    begin
        next_st = current_st;
        out_edge = 1'b0;

        case(current_st) //this line opened a case for the value on the current state
            zero:   //if the current state are on zero the next state are will on one and output are will bouth
                begin 
                        next_st = one;
                        out_edge = 1'b1;
                end
            one:    //if the current state are on one the next state are will on zero 
                begin
                        next_st = zero;
                end
            default: // the default value assign zero in the next state.
                begin
                    next_st = zero;
                end
        endcase
    end
endmodule 
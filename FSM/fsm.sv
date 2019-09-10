module edge_mealy(
    input wire clk,reset,
    input wire in_edge,
    output reg out_edge
);

localparam 
    zero = 1'b0,
    one = 1'b1;

reg current_st, next_st;

always@(posedge clk)
    begin
        if (reset) begin
            current_st <= zero;
        end
        else begin
            current_st <= next_st;
        end
    end
always@(*)
    begin
        next_st = current_st;
        out_edge = 1'b0;

        case(current_st)
            zero:
                begin
                    if (in_edge) begin
                        next_st = one;
                        out_edge = 1'b1;
                    end
                end
            one:
                begin
                    if (in_edge == 1'b0) begin
                        next_st = zero;
                    end
                end
            default:
                begin
                    next_st = zero;
                end
        endcase
    end
endmodule 
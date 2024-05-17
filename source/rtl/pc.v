module pc #(
    parameter DATA_WIDTH = 32
) (
    clk_i, pc_next_i, reset_l_i, pc_o
);
    input [DATA_WIDTH-1:0] pc_next_i;
    input reset_l_i, clk_i;

    output reg [DATA_WIDTH-1:0] pc_o;

    always @(posedge clk_i) begin
        if (reset_l_i == 1'b0) begin
            pc_o <= 32'h00000000;
        end else begin
            pc_o <= pc_next_i;
        end
    end
endmodule
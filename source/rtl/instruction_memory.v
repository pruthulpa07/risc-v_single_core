module instruction_memory #(
    parameter DATA_WIDTH = 32,
    parameter MEMORY_DEPTH = 1024
) (
    address_i, reset_l_i, data_o
);

    input [DATA_WIDTH-1:0] address_i;
    input reset_l_i;

    output [DATA_WIDTH-1:0] data_o;

    reg [DATA_WIDTH-1:0] memory [MEMORY_DEPTH-1:0];

    assign data_o = reset_l_i == 1'b0 ? 32'h00000000: memory[address_i[DATA_WIDTH-1:1]];
    
endmodule
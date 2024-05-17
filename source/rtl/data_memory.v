module data_memory #(
    parameter DATA_WIDTH = 32,
    parameter MEMORY_DEPTH = 1024
) (
    clk_i, address_i, write_data_i, write_enable_i, read_data_o
);

    input [DATA_WIDTH-1:0] address_i, write_data_i;
    input write_enable_i, clk_i;

    output [DATA_WIDTH-1:0] read_data_o;

    reg [DATA_WIDTH-1:0] memory [MEMORY_DEPTH-1:0];

    assign read_data_o = (write_enable_i == 1'b0) ?memory[address_i]: 32'h00000000;

    always @(posedge clk_i) begin
        if(write_enable_i) begin
            memory[address_i] <= write_data_i;
        end
    end
    
endmodule
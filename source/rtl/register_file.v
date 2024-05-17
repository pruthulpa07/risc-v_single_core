module register_file #(
    parameter DATA_WIDTH = 32,
    parameter MEMORY_DEPTH = 32
) (
    addr1_i, addr2_i, addr3_i, write_data_i, write_enable_i, clk_i, reset_l_i, data1_o, data2_o
);
    input [$clog2(MEMORY_DEPTH)-1:0] addr1_i, addr2_i, addr3_i;
    input [DATA_WIDTH-1:0] write_data_i, data1_o, data2_o;

    input clk_i, write_enable_i, reset_l_i;

    reg [DATA_WIDTH-1:0] registers [MEMORY_DEPTH-1:0];

    assign data1_o = reset_l_i == 1'b0 ? 32'h00000000 : registers[addr1_i];
    assign data2_o = reset_l_i == 1'b0 ? 32'h00000000 : registers[addr2_i];

    always @(posedge clk_i ) begin
        if(write_enable_i) begin
            registers[addr3_i] <= write_data_i ;
        end
    end
endmodule
module sign_extend #(
    parameter DATA_WIDTH = 32,
    parameter EXTEND_WIDTH = 20
) (
    data_i, data_o
);
    input [DATA_WIDTH-1:0] data_i, data_o;

    assign data_o = data_i[DATA_WIDTH-1] ? {{(EXTEND_WIDTH){1'b1}}, data_i[DATA_WIDTH-1:EXTEND_WIDTH]} : {{(EXTEND_WIDTH){1'b0}}, data_i[DATA_WIDTH-1:EXTEND_WIDTH]};
endmodule
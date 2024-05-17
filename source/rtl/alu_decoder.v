module alu_decoder (
    aluOp_i, op5_i, funct3_i, funct7_i, aluControl_o
);
    
    input [1:0] aluOp_i;
    input op5_i, funct7_i;
    input [2:0] funct3_i;

    output [2:0] aluControl_o;

    wire [1:0] op5_funct7;

    assign op5_funct7 = {op5_i, funct7_i};

    assign aluControl_o = (aluOp_i == 2'b00) ? 3'b000 : 
                        (aluOp_i == 2'b01) ? 3'b001 : 
                        (aluOp_i == 2'b10 & funct3_i == 3'b010) ? 3'b101 : 
                        (aluOp_i == 2'b10 & funct3_i == 3'b110) ? 3'b011 : 
                        (aluOp_i == 2'b10 & funct3_i == 3'b111) ? 3'b010 : 
                        (aluOp_i == 2'b10 & funct3_i == 3'b000 & op5_funct7 == 2'b11) ? 3'b001 : 
                        (aluOp_i == 2'b10 & funct3_i == 3'b000 & op5_funct7 != 2'b11) ? 3'b000 : 3'b000;

endmodule
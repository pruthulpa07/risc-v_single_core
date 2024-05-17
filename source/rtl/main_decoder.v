module main_decoder (
    Opcode, ZeroFlag, PCSrc, ResultSrc, MemWrite, ALUSrc, ImmSrc, RegWrite, ALUOp
);

    input [6:0] Opcode;
    input ZeroFlag;

    output PCSrc, ResultSrc, MemWrite, ALUSrc, RegWrite;
    output [1:0] ImmSrc, ALUOp;

    wire branch;

    assign RegWrite = (Opcode == 7'b0000011 | Opcode == 7'b0110011) ? 1'b1 : 1'b0;

    assign ImmSrc = (Opcode == 7'b0100011 ) ? 2'b01 : 
                    (Opcode == 7'b1100011 ) ? 2'b10 : 2'b00;

    assign ALUSrc = (Opcode == 7'b0000011 | Opcode == 7'b0100011) ? 1'b1 : 1'b0;

    assign MemWrite = (Opcode == 7'b0100011) ? 1'b1 : 1'b0;

    assign ResultSrc = (Opcode == 7'b0000011) ? 1'b1 : 1'b0;

    assign branch = (Opcode == 7'b1100011) ? 1'b1 : 1'b0;

    assign ALUOp = (Opcode == 7'b0110011 ) ? 2'b10 : 
                    (Opcode == 7'b1100011 ) ? 2'b01 : 2'b00;

    assign PCSrc = ZeroFlag & branch;

    
endmodule
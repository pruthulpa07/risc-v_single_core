module alu #(
    parameter DATA_WIDTH = 32;
)(
    A, B, ALUControlSignal, Result, ZeroFlag, NegativeFlag, CarryFlag, OverflowFlag
);

    input [DATA_WIDTH - 1:0] A, B;
    input [2:0] ALUControlSignal;

    output [DATA_WIDTH - 1:0] Result;

    wire [DATA_WIDTH - 1:0] not_B;
    wire [DATA_WIDTH - 1:0] A_or_B;
    wire [DATA_WIDTH - 1:0] A_and_B;
    wire [DATA_WIDTH - 1:0] mux_B;
    wire [DATA_WIDTH - 1:0] sum;
    wire [DATA_WIDTH - 1:0] mux_out;
    wire cout;
    wire [DATA_WIDTH - 1:0] slt_out:

    // OR operation
    assign A_or_B = A | B;

    // AND operation
    assign A_and_B = A & B;

    // Negate B
    assign not_B = ~B;

    // Select B
    assign mux_B = ALUControlSignal[0] == 1'b0 ? B : not_B;

    // Calculate SUM
    assign {cout, sum} = A + mux_B + ALUControlSignal[0]; // Find 2's complement of B in case of SUB

    // Sign extension
    assign slt_out = {DATA_WIDTH - 1{1'b0}, sum[DATA_WIDTH - 1]};

    // Select outputs based on control signal
    assign mux_out = ALUControlSignal[2:0] == 3'b000? sum :
              ALUControlSignal[2:0] == 3'b001? sum :
              ALUControlSignal[2:0] == 3'b010? A_and_B : 
              ALUControlSignal[2:0] == 3'b011? A_or_B:
              ALUControlSignal[2:0] == 3'b101? slt_out: {DATA_WIDTH{1'b0}};

    assign Result = mux_out;

    // Flags
    assign CarryFlag = cout & (~ALUControlSignal[1]);
    assign ZeroFlag = &(~mux_out);
    assign NegativeFlag = Result[DATA_WIDTH - 1];
    assign OverflowFlag = (~ALUControlSignal[1]) & (A[DATA_WIDTH - 1] ^ sum[DATA_WIDTH - 1]) & ~(A[DATA_WIDTH - 1] ^ B[DATA_WIDTH - 1]);
    
endmodule
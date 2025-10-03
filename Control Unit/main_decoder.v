module MainDecoder(
    input [6:0] op,
    output reg RegWrite, Jump,
    output reg MemWrite,
    output reg Branch,
    output reg ALUSrc,
    output reg [1:0] ResultSrc,
    output reg [1:0] ALUop,
    output reg [1:0] ImmSrc
);
    always @(*) begin
        case(op)
            7'b0000011: begin // Load Word Instruction
                RegWrite = 1;
                ImmSrc =2'b00;
                ALUSrc = 1'b1;
                MemWrite = 1'b0;
                ResultSrc = 2'b01;
                Branch = 1'b0;
                ALUop = 2'b00;
                Jump = 1'b0;
            end
            7'b0100011: begin // Store Word Instruction
                RegWrite = 1'b0;
                ImmSrc =2'b01;
                ALUSrc = 1'b1;
                MemWrite = 1'b1;
                ResultSrc = 2'b00;
                Branch = 1'b0;
                ALUop = 2'b00;
                Jump = 1'b0;
            end
            7'b0110011: begin // R-type
                RegWrite = 1'b1;
                ImmSrc =2'bxx;
                ALUSrc = 1'b0;
                MemWrite = 1'b0;
                ResultSrc = 2'b00;
                Branch = 1'b0;
                ALUop = 2'b10;
                Jump = 1'b0;
            end
            7'b1100011: begin // Beq
                RegWrite = 1'b0;
                ImmSrc =2'b10;
                ALUSrc = 1'b0;
                MemWrite = 1'b0;
                ResultSrc = 2'b00;
                Branch = 1'b1;
                ALUop = 2'b01;
                Jump = 1'b0;
            end
            7'b0010011: begin // I-type Instruction
                RegWrite = 1'b1;
                ImmSrc =2'b00;
                ALUSrc = 1'b1;
                MemWrite = 1'b0;
                ResultSrc = 2'b00;
                Branch = 1'b0;
                ALUop = 2'b10;
                Jump = 1'b0;
            end
            7'b1101111: begin // Jal
                RegWrite = 1'b1;
                ImmSrc =2'b11;
                ALUSrc = 1'b0;
                MemWrite = 1'b0;
                ResultSrc = 2'b10;
                Branch = 1'b0;
                ALUop = 2'b00;
                Jump = 1'b1;
            end
            default: begin
                RegWrite = 1'b0;
                ImmSrc =2'b00;
                ALUSrc = 1'b0;
                MemWrite = 1'b0;
                ResultSrc = 2'b00;
                Branch = 1'b0;
                ALUop = 2'b00;
                Jump = 1'b0;
            end
        endcase
    end
endmodule
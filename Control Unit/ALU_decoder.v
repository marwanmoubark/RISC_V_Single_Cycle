
module ALUDecoder(
    input OP5,
    input [2:0] funct3,
    input funct7,
    input [1:0] ALUop,
    output reg [2:0] ALUControl
);
    always @(*) begin
        casex({ALUop, funct3, OP5, funct7})
        7'b00_xxx_xx: ALUControl = 3'b000;
        7'b01_xxx_xx: ALUControl = 3'b001;
        
        7'b10_000_0_0: ALUControl = 3'b000;
        7'b10_000_0_1: ALUControl = 3'b000;
        7'b10_000_1_0: ALUControl = 3'b000;
        7'b10_000_1_1: ALUControl = 3'b001;
        
        7'b10_010_xx: ALUControl = 3'b101;
        
        7'b10_110_xx: ALUControl = 3'b011;
        7'b10_111_xx: ALUControl = 3'b010;
        
        default: ALUControl = 3'b000;
    endcase
    end
endmodule
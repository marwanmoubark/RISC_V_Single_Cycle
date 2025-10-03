module ALU_RISC_V(
    input [2:0] ALUControl, 
    input [31:0] SrcA, SrcB, 
    output reg [31:0] Result, 
    output reg ZERO
);

always @(*) begin
    case (ALUControl)
        3'b000: Result = SrcA + SrcB;                    
        3'b001: Result = SrcA - SrcB;                    
        3'b101: Result = (SrcA < SrcB) ? 32'd1 : 32'd0; 
        3'b011: Result = SrcA | SrcB;                    
        3'b010: Result = SrcA & SrcB;                    
        default: Result = 32'd0;
    endcase

    // ZERO flag should always be defined
    if (Result == 32'd0)
        ZERO = 1'b1;
    else
        ZERO = 1'b0;
end

endmodule

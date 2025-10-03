module Extend(
    input [1:0] immSrc, 
    input [31:0] Instr,
    output reg [31:0] immExt
);

always@(*) begin
    case(immSrc) 
    2'b00 : immExt = {{20{Instr[31]}}, Instr[31:20]};
    2'b01 : immExt = {{20{Instr[31]}}, Instr[31:25], Instr[11:7]};
    2'b10 : immExt = {{20{Instr[31]}}, Instr[7], Instr[30:25], Instr[11:8], 1'b0}; 
    2'b11 : immExt = {{12{Instr[31]}}, Instr[19:12], Instr[20], Instr[30:21], 1'b0}; 
    endcase
    
end
endmodule
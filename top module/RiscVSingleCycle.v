module RV32I(
    input  clk, reset,
    input  [31:0]   Instr,
    input  [31:0]  ReadData,
    output [31:0]   PC,
    output MemWrite,
    output [31:0]  ALUResult, WriteData
    
    );


 wire ALUSrc, RegWrite, Jump, Zero;
 wire [1:0] ResultSrc, ImmSrc;
 wire [2:0] ALUControl;
 //control Unit instantiate
control_unit c(.OP(Instr[6:0]), .funct3(Instr[14:12]), .funct7(Instr[30]), .ZERO(Zero),
 .ResultSrc(ResultSrc), .MemWrite(MemWrite), .PCSrc(PCSrc),
 .ALUSrc(ALUSrc), .RegWrite(RegWrite), 
 .ImmSrc(ImmSrc), .ALUControl(ALUControl));

 //datapath instantiate
 data_path dp(.CLK(clk), .reset(reset), .ResultSrc(ResultSrc), .PCSrc(PCSrc),
 .ALUSrc(ALUSrc), .RegWrite(RegWrite),
 .immSrc(ImmSrc), .ALUControl(ALUControl),
 .ZERO(Zero), .PC(PC), .Instr(Instr),
 .ALUResult(ALUResult), .WriteData(WriteData), .ReadData(ReadData));
endmodule
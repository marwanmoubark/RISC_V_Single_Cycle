module data_path(
    input CLK , reset,
    input PCSrc , ALUSrc, RegWrite,
    input[1:0] ResultSrc , 
    input [2:0]ALUControl , 
    input [1:0] immSrc,
    input [31:0] Instr , ReadData,
    output ZERO , 
    output [31:0] PC , ALUResult , WriteData 
);
    wire [31:0] PCNext, PCPlus4, PCTarget;
    wire [31:0] ImmExt;
    wire [31:0] SrcA, SrcB;
    wire [31:0] Result;

       // next PC logic
    program_counter pcreg(.CLK(CLK), .PC_next(PCNext),.reset(reset), .PC(PC));
    adder           pcadd4(.A(PC) , .B(32'd4) , .Y(PCPlus4));
    adder           pcaddbranch(.A(PC), .B(ImmExt), .Y(PCTarget));
    MUX_2 #(32)    pcmux(.A(PCPlus4), .B(PCTarget), .s(PCSrc), .y(PCNext));
    // register file logic
    reg_file         regfile(.CLK(CLK), .WE3(RegWrite), .A1(Instr[19:15]), .A2(Instr[24:20]), .A3(Instr[11:7]), .WD3(Result), .RD1(SrcA), .RD2(WriteData));
    Extend         ext(.Instr(Instr[31:0]), .immSrc(immSrc), .immExt(ImmExt));

    // ALU logic
    MUX_2 #(32)   srcbmux(.A(WriteData), .B(ImmExt), .s(ALUSrc), .y(SrcB));
    ALU_RISC_V    alu(.SrcA(SrcA), .SrcB(SrcB), .ALUControl(ALUControl), .Result(ALUResult), .ZERO(ZERO));
     MUX_3 #(32)  resultmux( .A(ALUResult), .B(ReadData), .C(PCPlus4), .s(ResultSrc), .Y(Result));
 endmodule

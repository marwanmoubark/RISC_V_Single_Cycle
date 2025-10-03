module RV32I_TOP(
    input clk, reset,
    output  [31:0] WriteData, 
    output [31:0] Data_Adr,
    output MemWrite 
    );
    wire[31:0] DataAdr;
    wire mem_write;
    wire [31:0] PC, Instr, ReadData;

    assign MemWrite = mem_write;
    assign Data_Adr = DataAdr;


    
    // instantiate processor and memories
    RV32I rvsingle( 
        .clk(clk), 
        .reset(reset), 
        .PC(PC), 
        .Instr(Instr), 
        .MemWrite(mem_write), 
        .ALUResult(DataAdr),  
        .WriteData(WriteData), 
        .ReadData(ReadData)
        );
    instruction_mem instruction_mem(
        .PC(PC), 
        .Instr(Instr)
        );

    Data_Memory  data_mem(
        .clk(clk), 
        .WE(mem_write), 
        .A(DataAdr), 
        .WD(WriteData), 
        .RD(ReadData)
        );
    
endmodule
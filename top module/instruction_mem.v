module instruction_mem(
    input [31:0]PC ,
    output [31:0] Instr
);
reg [31 : 0] mem [63 : 0];
initial begin
    $readmemh("D:\\Users\\Mohamed\\VIVADOS\\RISC_V 32\\memfile.dat", mem);
end
assign Instr = mem[PC[31:2] ];
endmodule
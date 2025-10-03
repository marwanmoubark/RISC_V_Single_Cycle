module control_unit(
    input [6:0] OP,
    input [2:0] funct3,
    input funct7,
    input ZERO,
    output wire PCSrc,
    output  [1:0] ResultSrc,
    output  MemWrite,
    output  [2:0] ALUControl,
    output  ALUSrc,
    output  [1:0] ImmSrc,
    output  RegWrite
);

// output declaration of module MainDecoder
wire Jump;
wire Branch;
wire [1:0] ALUop;

MainDecoder u_MainDecoder(
    .op        	(OP         ),
    .RegWrite  	(RegWrite   ),
    .Jump      	(Jump       ),
    .MemWrite  	(MemWrite   ),
    .Branch    	(Branch     ),
    .ALUSrc    	(ALUSrc     ),
    .ResultSrc 	(ResultSrc  ),
    .ALUop     	(ALUop      ),
    .ImmSrc    	(ImmSrc     )
);


ALUDecoder u_ALUDecoder(
    .OP5        	(OP[5]         ),
    .funct3     	(funct3      ),
    .funct7     	(funct7      ),
    .ALUop      	(ALUop       ),
    .ALUControl 	(ALUControl  )
);
assign PCSrc = Branch & ZERO | Jump;


endmodule
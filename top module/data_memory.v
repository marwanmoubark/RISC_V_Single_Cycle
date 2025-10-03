module Data_Memory(
input clk, WE, 
input [31:0]A, 
input [31:0] WD, 
output  [31:0]RD 
    );
    reg [31:0] mem[63:0]; 
    
    assign RD = mem[A[31:2]];
    
    always @(posedge clk) begin
        if (WE) 
           mem[A[31:2]]<= WD;
    end
    
      
endmodule
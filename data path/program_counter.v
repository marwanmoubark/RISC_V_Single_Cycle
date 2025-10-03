module program_counter(
    input CLK,reset,
    input [31:0] PC_next,
    output reg [31:0] PC 
);

always@(posedge CLK , posedge reset  ) 
begin
    if(reset) PC <= 32'h0;
    else      PC <= PC_next;
end
endmodule
module reg_file(
    input CLK , WE3 ,
    input [4:0] A1 , A2 , A3 ,
    input [31:0] WD3,
    output reg [31:0] RD1 , RD2 
    
);
    integer i ;
    reg [31:0] register_file[31:0];

    
    initial begin
        for ( i = 0 ; i < 32 ; i = i + 1)
        begin
            register_file[i] = i ;
        end
    end


    always@(posedge CLK)
    if (WE3)
        register_file[A3] <= WD3;
    
    always@(*) begin
        RD1 =  register_file[A1];
        RD2 =  register_file[A2];
    end
    
endmodule

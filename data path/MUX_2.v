module MUX_2 #(parameter width = 32)
(
    input [width - 1 : 0 ] A , B ,
    input s ,
    output [width - 1 : 0] y
);
assign y = s ? B : A ;
endmodule
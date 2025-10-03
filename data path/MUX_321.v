module MUX_3 #(parameter width = 32)
(
    input[width - 1 : 0] A , B , C,
    input [1:0] s ,
    output [width - 1 : 0 ] Y
);
 assign Y = s[1] ? C : (s[0] ? B : A);
endmodule
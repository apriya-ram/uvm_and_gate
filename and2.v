module and2
(
        input a,b,
        output reg c
);

always@(a,b)
begin
        c=a&b;
end

endmodule 



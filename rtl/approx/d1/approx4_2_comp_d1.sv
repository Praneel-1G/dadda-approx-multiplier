module approx4_2_comp_d1 (
    input wire X1 , X2 , X3 ,X4, // from the input reorder
    output wire Carry , Sum
);
// Sum = X1 . ~(X2 + X3 + X4)[cite: 1]
assign Sum = X1 & ~(X2 | X3 | X4);

// Carry = (X2 + X3) . ~X4[cite: 1]
assign Carry = (X2 | X3) & ~X4;

    
endmodule
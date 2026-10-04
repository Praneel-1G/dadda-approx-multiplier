module d1_compressor_block (
    input wire p1 , p2 , p3 , p4,
    output wire Sum , Carry
);
wire i1 , i2 , i3 , i4;

input_reorder sort(.A(p1), .B(p2) , .C(p3), .D(p4) , .X1(i1), .X2(i2), .X3(i3), .X4(i4));
approx4_2_comp_d1 core (
        .X1(i1), .X2(i2), .X3(i3), .X4(i4),
        .Sum(Sum), .Carry(Carry)
    );
endmodule
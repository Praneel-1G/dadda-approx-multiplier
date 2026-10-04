module approx_dadda_d1 #(parameter WIDTH = 8)(
    input  wire [7:0] A, B,
    output wire [15:0] P
);

wire pp[0:7][0:7];
genvar i, j;
generate
    for(i = 0; i < 8; i = i + 1) begin: GI
        for(j = 0; j < 8; j = j + 1) begin: GJ
            assign pp[i][j] = A[i] & B[j];
        end        
    end
endgenerate

// STAGE 1: Reduce max column height from 8 down to 4

// Wires for Stage 1 outputs (cin/cout wires removed)
wire s1_c4_s, c1_c5_c1;
wire s1_c5_s, c1_c6_c1;
wire s1_c6_s, c1_c7_c1, s1_c6_fa_s, c1_c7_fa_c;
wire s1_c7_s1, c1_c8_c1, s1_c7_s2, c1_c8_c2;
wire s1_c8_s1, c1_c9_c1, s1_c8_s2, c1_c9_c2;
wire s1_c9_s1, c1_c10_c1, s1_c9_fa_s, c1_c10_fa_c;
wire s1_c10_s, c1_c11_c1;
wire s1_c11_s, c1_c12_c1;
wire s1_c12_s, c1_c13_c1;

// Col 4 (5 bits)
fa s1_c4_fa (.a(pp[0][4]), .b(pp[1][3]), .cin(pp[2][2]), .sum(s1_c4_s), .cout(c1_c5_c1));

// Col 5 (6 bits)
d1_compressor_block s1_c5_comp (.p1(pp[0][5]), .p2(pp[1][4]), .p3(pp[2][3]), .p4(pp[3][2]), .Sum(s1_c5_s), .Carry(c1_c6_c1));

// Col 6 (7 bits)
d1_compressor_block s1_c6_comp (.p1(pp[0][6]), .p2(pp[1][5]), .p3(pp[2][4]), .p4(pp[3][3]), .Sum(s1_c6_s), .Carry(c1_c7_c1));
fa s1_c6_fa (.a(pp[4][2]), .b(pp[5][1]), .cin(pp[6][0]), .sum(s1_c6_fa_s), .cout(c1_c7_fa_c));

// Col 7 (8 bits)
d1_compressor_block s1_c7_comp1 (.p1(pp[0][7]), .p2(pp[1][6]), .p3(pp[2][5]), .p4(pp[3][4]), .Sum(s1_c7_s1), .Carry(c1_c8_c1));
d1_compressor_block s1_c7_comp2 (.p1(pp[4][3]), .p2(pp[5][2]), .p3(pp[6][1]), .p4(pp[7][0]), .Sum(s1_c7_s2), .Carry(c1_c8_c2));

// Col 8 (7 bits + 1 carry)
d1_compressor_block s1_c8_comp1 (.p1(pp[1][7]), .p2(pp[2][6]), .p3(pp[3][5]), .p4(pp[4][4]), .Sum(s1_c8_s1), .Carry(c1_c9_c1));
d1_compressor_block s1_c8_comp2 (.p1(pp[5][3]), .p2(pp[6][2]), .p3(pp[7][1]), .p4(c1_c8_c1), .Sum(s1_c8_s2), .Carry(c1_c9_c2));

// Col 9 (6 bits + 1 carry)
d1_compressor_block s1_c9_comp (.p1(pp[2][7]), .p2(pp[3][6]), .p3(pp[4][5]), .p4(pp[5][4]), .Sum(s1_c9_s1), .Carry(c1_c10_c1));
fa s1_c9_fa (.a(pp[6][3]), .b(pp[7][2]), .cin(c1_c9_c1), .sum(s1_c9_fa_s), .cout(c1_c10_fa_c));

// Col 10 (5 bits)
d1_compressor_block s1_c10_comp (.p1(pp[3][7]), .p2(pp[4][6]), .p3(pp[5][5]), .p4(pp[6][4]), .Sum(s1_c10_s), .Carry(c1_c11_c1));

// Col 11 (4 bits)
d1_compressor_block s1_c11_comp (.p1(pp[4][7]), .p2(pp[5][6]), .p3(pp[6][5]), .p4(pp[7][4]), .Sum(s1_c11_s), .Carry(c1_c12_c1));

// Col 12 (3 bits - padding 4th bit with 0)
d1_compressor_block s1_c12_comp (.p1(pp[5][7]), .p2(pp[6][6]), .p3(pp[7][5]), .p4(1'b0), .Sum(s1_c12_s), .Carry(c1_c13_c1));


// STAGE 2: Reduce height from 4 down to 2
// Wires for Stage 2 outputs (cin/cout wires removed)
wire s2_c2_s, c2_c3_c;
wire s2_c3_s, c3_carry;
wire s2_c4_s, c4_carry;
wire s2_c5_s, c5_carry;
wire s2_c6_s, c6_carry;
wire s2_c7_s, c7_carry;
wire s2_c8_s, c8_carry;
wire s2_c9_s, c9_carry;
wire s2_c10_s, c10_carry;
wire s2_c11_s, c11_carry;
wire s2_c12_s, c12_carry;
wire s2_c13_s, c13_carry;
wire s2_c14_s, c14_carry;

ha s2_c2_ha (.a(pp[0][2]), .b(pp[1][1]), .sum(s2_c2_s), .carry(c2_c3_c));

d1_compressor_block s2_c3_comp (.p1(pp[0][3]), .p2(pp[1][2]), .p3(pp[2][1]), .p4(pp[3][0]), .Sum(s2_c3_s), .Carry(c3_carry));
d1_compressor_block s2_c4_comp (.p1(s1_c4_s), .p2(pp[3][1]), .p3(pp[4][0]), .p4(1'b0), .Sum(s2_c4_s), .Carry(c4_carry));
d1_compressor_block s2_c5_comp (.p1(s1_c5_s), .p2(pp[4][1]), .p3(pp[5][0]), .p4(c1_c5_c1), .Sum(s2_c5_s), .Carry(c5_carry));
d1_compressor_block s2_c6_comp (.p1(s1_c6_s), .p2(s1_c6_fa_s), .p3(c1_c6_c1), .p4(1'b0), .Sum(s2_c6_s), .Carry(c6_carry));
d1_compressor_block s2_c7_comp (.p1(s1_c7_s1), .p2(s1_c7_s2), .p3(c1_c7_c1), .p4(c1_c7_fa_c), .Sum(s2_c7_s), .Carry(c7_carry));
d1_compressor_block s2_c8_comp (.p1(s1_c8_s1), .p2(s1_c8_s2), .p3(c1_c8_c2), .p4(1'b0), .Sum(s2_c8_s), .Carry(c8_carry));

// Previous exact code used c1_c9_cout2 in p4 here, replaced with 1'b0
d1_compressor_block s2_c9_comp (.p1(s1_c9_s1), .p2(s1_c9_fa_s), .p3(c1_c9_c2), .p4(1'b0), .Sum(s2_c9_s), .Carry(c9_carry));
d1_compressor_block s2_c10_comp (.p1(s1_c10_s), .p2(pp[7][3]), .p3(c1_c10_c1), .p4(c1_c10_fa_c), .Sum(s2_c10_s), .Carry(c10_carry));
d1_compressor_block s2_c11_comp (.p1(s1_c11_s), .p2(c1_c11_c1), .p3(1'b0), .p4(1'b0), .Sum(s2_c11_s), .Carry(c11_carry));
d1_compressor_block s2_c12_comp (.p1(s1_c12_s), .p2(c1_c12_c1), .p3(1'b0), .p4(1'b0), .Sum(s2_c12_s), .Carry(c12_carry));

// Previous exact code used c1_c13_cout in p4 here, replaced with 1'b0
d1_compressor_block s2_c13_comp (.p1(pp[6][7]), .p2(pp[7][6]), .p3(c1_c13_c1), .p4(1'b0), .Sum(s2_c13_s), .Carry(c13_carry));

// Previous exact code was FA utilizing c13_cout. Replaced with HA.
ha s2_c14_ha (.a(pp[7][7]), .b(c13_carry), .sum(s2_c14_s), .carry(c14_carry));


// STAGE 3: Final Carry Propagate Addition (CPA)

wire [15:0] op1, op2;

assign op1 = {
    c14_carry, s2_c14_s, s2_c13_s, s2_c12_s, s2_c11_s, s2_c10_s, s2_c9_s, s2_c8_s, 
    s2_c7_s, s2_c6_s, s2_c5_s, s2_c4_s, s2_c3_s, pp[2][0], pp[0][1], pp[0][0]
};

assign op2 = {
    1'b0, 1'b0, c12_carry, c11_carry, c10_carry, c9_carry, c8_carry, c7_carry, 
    c6_carry, c5_carry, c4_carry, c3_carry, c2_c3_c, s2_c2_s, pp[1][0], 1'b0
};

assign P = op1 + op2;

endmodule
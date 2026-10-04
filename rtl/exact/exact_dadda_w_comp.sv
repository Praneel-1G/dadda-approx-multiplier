module exact_dadda_with_compressor #(parameter WIDTH = 8)(
    input wire [7:0] A, B,
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
// Wires for Stage 1 outputs
wire s1_c4_s, c1_c5_c1;
wire s1_c5_s, c1_c6_c1, c1_c6_cout;
wire s1_c6_s, c1_c7_c1, c1_c7_cout, s1_c6_fa_s, c1_c7_fa_c;
wire s1_c7_s1, c1_c8_c1, c1_c8_cout1, s1_c7_s2, c1_c8_c2, c1_c8_cout2;
wire s1_c8_s1, c1_c9_c1, c1_c9_cout1, s1_c8_s2, c1_c9_c2, c1_c9_cout2;
wire s1_c9_s1, c1_c10_c1, c1_c10_cout, s1_c9_fa_s, c1_c10_fa_c;
wire s1_c10_s, c1_c11_c1, c1_c11_cout;
wire s1_c11_s, c1_c12_c1, c1_c12_cout;
wire s1_c12_s, c1_c13_c1, c1_c13_cout;

// Col 4 (5 bits)
fa s1_c4_fa (.a(pp[0][4]), .b(pp[1][3]), .cin(pp[2][2]), .sum(s1_c4_s), .cout(c1_c5_c1));

// Col 5 (6 bits + 1 carry)
exact4_2_comp s1_c5_comp (.x1(pp[0][5]), .x2(pp[1][4]), .x3(pp[2][3]), .x4(pp[3][2]), .cin(1'b0), .sum(s1_c5_s), .carry(c1_c6_c1), .cout(c1_c6_cout));

// Col 6 (7 bits + 2 carries)
exact4_2_comp s1_c6_comp (.x1(pp[0][6]), .x2(pp[1][5]), .x3(pp[2][4]), .x4(pp[3][3]), .cin(c1_c6_cout), .sum(s1_c6_s), .carry(c1_c7_c1), .cout(c1_c7_cout));
fa s1_c6_fa (.a(pp[4][2]), .b(pp[5][1]), .cin(pp[6][0]), .sum(s1_c6_fa_s), .cout(c1_c7_fa_c));

// Col 7 (8 bits + 3 carries)
exact4_2_comp s1_c7_comp1 (.x1(pp[0][7]), .x2(pp[1][6]), .x3(pp[2][5]), .x4(pp[3][4]), .cin(c1_c7_cout), .sum(s1_c7_s1), .carry(c1_c8_c1), .cout(c1_c8_cout1));
exact4_2_comp s1_c7_comp2 (.x1(pp[4][3]), .x2(pp[5][2]), .x3(pp[6][1]), .x4(pp[7][0]), .cin(1'b0), .sum(s1_c7_s2), .carry(c1_c8_c2), .cout(c1_c8_cout2));

// Col 8 (7 bits + 4 carries)
exact4_2_comp s1_c8_comp1 (.x1(pp[1][7]), .x2(pp[2][6]), .x3(pp[3][5]), .x4(pp[4][4]), .cin(c1_c8_cout1), .sum(s1_c8_s1), .carry(c1_c9_c1), .cout(c1_c9_cout1));
exact4_2_comp s1_c8_comp2 (.x1(pp[5][3]), .x2(pp[6][2]), .x3(pp[7][1]), .x4(c1_c8_c1), .cin(c1_c8_cout2), .sum(s1_c8_s2), .carry(c1_c9_c2), .cout(c1_c9_cout2));

// Col 9 (6 bits + 4 carries)
exact4_2_comp s1_c9_comp (.x1(pp[2][7]), .x2(pp[3][6]), .x3(pp[4][5]), .x4(pp[5][4]), .cin(c1_c9_cout1), .sum(s1_c9_s1), .carry(c1_c10_c1), .cout(c1_c10_cout));
fa s1_c9_fa (.a(pp[6][3]), .b(pp[7][2]), .cin(c1_c9_c1), .sum(s1_c9_fa_s), .cout(c1_c10_fa_c));

// Col 10 (5 bits + 3 carries)
exact4_2_comp s1_c10_comp (.x1(pp[3][7]), .x2(pp[4][6]), .x3(pp[5][5]), .x4(pp[6][4]), .cin(c1_c10_cout), .sum(s1_c10_s), .carry(c1_c11_c1), .cout(c1_c11_cout));

// Col 11 (4 bits + 2 carries)
exact4_2_comp s1_c11_comp (.x1(pp[4][7]), .x2(pp[5][6]), .x3(pp[6][5]), .x4(pp[7][4]), .cin(c1_c11_cout), .sum(s1_c11_s), .carry(c1_c12_c1), .cout(c1_c12_cout));

// Col 12 (3 bits + 2 carries)
exact4_2_comp s1_c12_comp (.x1(pp[5][7]), .x2(pp[6][6]), .x3(pp[7][5]), .x4(1'b0), .cin(c1_c12_cout), .sum(s1_c12_s), .carry(c1_c13_c1), .cout(c1_c13_cout));


// STAGE 2: Reduce height from 4 down to 2
//----------------------------------------------
// Wires for Stage 2 outputs
wire s2_c2_s, c2_c3_c;
wire s2_c3_s, c3_carry, c3_cout;
wire s2_c4_s, c4_carry, c4_cout;
wire s2_c5_s, c5_carry, c5_cout;
wire s2_c6_s, c6_carry, c6_cout;
wire s2_c7_s, c7_carry, c7_cout;
wire s2_c8_s, c8_carry, c8_cout;
wire s2_c9_s, c9_carry, c9_cout;
wire s2_c10_s, c10_carry, c10_cout;
wire s2_c11_s, c11_carry, c11_cout;
wire s2_c12_s, c12_carry, c12_cout;
wire s2_c13_s, c13_carry, c13_cout;
wire s2_c14_s, c14_carry;

ha s2_c2_ha (.a(pp[0][2]), .b(pp[1][1]), .sum(s2_c2_s), .carry(c2_c3_c));

exact4_2_comp s2_c3_comp (.x1(pp[0][3]), .x2(pp[1][2]), .x3(pp[2][1]), .x4(pp[3][0]), .cin(1'b0), .sum(s2_c3_s), .carry(c3_carry), .cout(c3_cout));
exact4_2_comp s2_c4_comp (.x1(s1_c4_s), .x2(pp[3][1]), .x3(pp[4][0]), .x4(1'b0), .cin(c3_cout), .sum(s2_c4_s), .carry(c4_carry), .cout(c4_cout));
exact4_2_comp s2_c5_comp (.x1(s1_c5_s), .x2(pp[4][1]), .x3(pp[5][0]), .x4(c1_c5_c1), .cin(c4_cout), .sum(s2_c5_s), .carry(c5_carry), .cout(c5_cout));
exact4_2_comp s2_c6_comp (.x1(s1_c6_s), .x2(s1_c6_fa_s), .x3(c1_c6_c1), .x4(1'b0), .cin(c5_cout), .sum(s2_c6_s), .carry(c6_carry), .cout(c6_cout));
exact4_2_comp s2_c7_comp (.x1(s1_c7_s1), .x2(s1_c7_s2), .x3(c1_c7_c1), .x4(c1_c7_fa_c), .cin(c6_cout), .sum(s2_c7_s), .carry(c7_carry), .cout(c7_cout));
exact4_2_comp s2_c8_comp (.x1(s1_c8_s1), .x2(s1_c8_s2), .x3(c1_c8_c2), .x4(1'b0), .cin(c7_cout), .sum(s2_c8_s), .carry(c8_carry), .cout(c8_cout));
exact4_2_comp s2_c9_comp (.x1(s1_c9_s1), .x2(s1_c9_fa_s), .x3(c1_c9_c2), .x4(c1_c9_cout2), .cin(c8_cout), .sum(s2_c9_s), .carry(c9_carry), .cout(c9_cout));
exact4_2_comp s2_c10_comp (.x1(s1_c10_s), .x2(pp[7][3]), .x3(c1_c10_c1), .x4(c1_c10_fa_c), .cin(c9_cout), .sum(s2_c10_s), .carry(c10_carry), .cout(c10_cout));
exact4_2_comp s2_c11_comp (.x1(s1_c11_s), .x2(c1_c11_c1), .x3(1'b0), .x4(1'b0), .cin(c10_cout), .sum(s2_c11_s), .carry(c11_carry), .cout(c11_cout));
exact4_2_comp s2_c12_comp (.x1(s1_c12_s), .x2(c1_c12_c1), .x3(1'b0), .x4(1'b0), .cin(c11_cout), .sum(s2_c12_s), .carry(c12_carry), .cout(c12_cout));
exact4_2_comp s2_c13_comp (.x1(pp[6][7]), .x2(pp[7][6]), .x3(c1_c13_c1), .x4(c1_c13_cout), .cin(c12_cout), .sum(s2_c13_s), .carry(c13_carry), .cout(c13_cout));

fa s2_c14_fa (.a(pp[7][7]), .b(c13_carry), .cin(c13_cout), .sum(s2_c14_s), .cout(c14_carry));


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

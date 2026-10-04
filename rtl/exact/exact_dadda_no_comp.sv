module exact_dadda_no_comp #(parameter WIDTH = 8)(
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

// STAGE 1: Reduce max column height from 8 to 6
wire s1_c6_s, s1_c6_c;
wire s1_c7_s1, s1_c7_c1;
wire s1_c7_s2, s1_c7_c2;
wire s1_c8_s1, s1_c8_c1;
wire s1_c8_s2, s1_c8_c2;
wire s1_c9_s, s1_c9_c;

ha s1_c6_ha ( .a(pp[0][6]), .b(pp[1][5]), .sum(s1_c6_s), .carry(s1_c6_c) );

fa s1_c7_fa ( .a(pp[0][7]), .b(pp[1][6]), .cin(pp[2][5]), .sum(s1_c7_s1), .cout(s1_c7_c1) );
ha s1_c7_ha ( .a(pp[3][4]), .b(pp[4][3]), .sum(s1_c7_s2), .carry(s1_c7_c2) );

fa s1_c8_fa ( .a(pp[1][7]), .b(pp[2][6]), .cin(pp[3][5]), .sum(s1_c8_s1), .cout(s1_c8_c1) );
ha s1_c8_ha ( .a(pp[4][4]), .b(pp[5][3]), .sum(s1_c8_s2), .carry(s1_c8_c2) );

fa s1_c9_fa ( .a(pp[2][7]), .b(pp[3][6]), .cin(pp[4][5]), .sum(s1_c9_s), .cout(s1_c9_c) );


// STAGE 2: Reduce max column height from 6 to 4
wire s2_c4_s, s2_c4_c;
wire s2_c5_s1, s2_c5_c1;
wire s2_c5_s2, s2_c5_c2;
wire s2_c6_s1, s2_c6_c1;
wire s2_c6_s2, s2_c6_c2;
wire s2_c7_s1, s2_c7_c1;
wire s2_c7_s2, s2_c7_c2;
wire s2_c8_s1, s2_c8_c1;
wire s2_c8_s2, s2_c8_c2;
wire s2_c9_s1, s2_c9_c1;
wire s2_c9_s2, s2_c9_c2;
wire s2_c10_s1, s2_c10_c1;
wire s2_c10_s2, s2_c10_c2;
wire s2_c11_s1, s2_c11_c1;

ha s2_c4_ha ( .a(pp[0][4]), .b(pp[1][3]), .sum(s2_c4_s), .carry(s2_c4_c) );

fa s2_c5_fa ( .a(pp[0][5]), .b(pp[1][4]), .cin(pp[2][3]), .sum(s2_c5_s1), .cout(s2_c5_c1) );
ha s2_c5_ha ( .a(pp[3][2]), .b(pp[4][1]), .sum(s2_c5_s2), .carry(s2_c5_c2) );

fa s2_c6_fa1( .a(s1_c6_s), .b(pp[2][4]), .cin(pp[3][3]), .sum(s2_c6_s1), .cout(s2_c6_c1) );
fa s2_c6_fa2( .a(pp[4][2]), .b(pp[5][1]), .cin(pp[6][0]), .sum(s2_c6_s2), .cout(s2_c6_c2) );

fa s2_c7_fa1( .a(s1_c6_c), .b(s1_c7_s1), .cin(s1_c7_s2), .sum(s2_c7_s1), .cout(s2_c7_c1) );
fa s2_c7_fa2( .a(pp[5][2]), .b(pp[6][1]), .cin(pp[7][0]), .sum(s2_c7_s2), .cout(s2_c7_c2) );

fa s2_c8_fa1( .a(s1_c7_c1), .b(s1_c7_c2), .cin(s1_c8_s1), .sum(s2_c8_s1), .cout(s2_c8_c1) );
fa s2_c8_fa2( .a(s1_c8_s2), .b(pp[6][2]), .cin(pp[7][1]), .sum(s2_c8_s2), .cout(s2_c8_c2) );

fa s2_c9_fa1( .a(s1_c8_c1), .b(s1_c8_c2), .cin(s1_c9_s), .sum(s2_c9_s1), .cout(s2_c9_c1) );
fa s2_c9_fa2( .a(pp[5][4]), .b(pp[6][3]), .cin(pp[7][2]), .sum(s2_c9_s2), .cout(s2_c9_c2) );

fa s2_c10_fa1( .a(s1_c9_c), .b(pp[3][7]), .cin(pp[4][6]), .sum(s2_c10_s1), .cout(s2_c10_c1) );
fa s2_c10_fa2( .a(pp[5][5]), .b(pp[6][4]), .cin(pp[7][3]), .sum(s2_c10_s2), .cout(s2_c10_c2) );

fa s2_c11_fa( .a(pp[4][7]), .b(pp[5][6]), .cin(pp[6][5]), .sum(s2_c11_s1), .cout(s2_c11_c1) );


// STAGE 3: Reduce max column height from 4 to 3
wire s3_c3_s, s3_c3_c;
wire s3_c4_s, s3_c4_c;
wire s3_c5_s, s3_c5_c;
wire s3_c6_s, s3_c6_c;
wire s3_c7_s, s3_c7_c;
wire s3_c8_s, s3_c8_c;
wire s3_c9_s, s3_c9_c;
wire s3_c10_s, s3_c10_c;
wire s3_c11_s, s3_c11_c;
wire s3_c12_s, s3_c12_c;

ha s3_c3_ha ( .a(pp[0][3]), .b(pp[1][2]), .sum(s3_c3_s), .carry(s3_c3_c) );
fa s3_c4_fa ( .a(s2_c4_s), .b(pp[2][2]), .cin(pp[3][1]), .sum(s3_c4_s), .cout(s3_c4_c) );
fa s3_c5_fa ( .a(s2_c4_c), .b(s2_c5_s1), .cin(s2_c5_s2), .sum(s3_c5_s), .cout(s3_c5_c) );
fa s3_c6_fa ( .a(s2_c5_c1), .b(s2_c5_c2), .cin(s2_c6_s1), .sum(s3_c6_s), .cout(s3_c6_c) );
fa s3_c7_fa ( .a(s2_c6_c1), .b(s2_c6_c2), .cin(s2_c7_s1), .sum(s3_c7_s), .cout(s3_c7_c) );
fa s3_c8_fa ( .a(s2_c7_c1), .b(s2_c7_c2), .cin(s2_c8_s1), .sum(s3_c8_s), .cout(s3_c8_c) );
fa s3_c9_fa ( .a(s2_c8_c1), .b(s2_c8_c2), .cin(s2_c9_s1), .sum(s3_c9_s), .cout(s3_c9_c) );
fa s3_c10_fa( .a(s2_c9_c1), .b(s2_c9_c2), .cin(s2_c10_s1), .sum(s3_c10_s), .cout(s3_c10_c) );
fa s3_c11_fa( .a(s2_c10_c1), .b(s2_c10_c2), .cin(s2_c11_s1), .sum(s3_c11_s), .cout(s3_c11_c) );
fa s3_c12_fa( .a(s2_c11_c1), .b(pp[5][7]), .cin(pp[6][6]), .sum(s3_c12_s), .cout(s3_c12_c) );


// STAGE 4: Reduce max column height from 3 to 2
wire s4_c2_s, s4_c2_c;
wire s4_c3_s, s4_c3_c;
wire s4_c4_s, s4_c4_c;
wire s4_c5_s, s4_c5_c;
wire s4_c6_s, s4_c6_c;
wire s4_c7_s, s4_c7_c;
wire s4_c8_s, s4_c8_c;
wire s4_c9_s, s4_c9_c;
wire s4_c10_s, s4_c10_c;
wire s4_c11_s, s4_c11_c;
wire s4_c12_s, s4_c12_c;
wire s4_c13_s, s4_c13_c;

ha s4_c2_ha ( .a(pp[0][2]), .b(pp[1][1]), .sum(s4_c2_s), .carry(s4_c2_c) );
fa s4_c3_fa ( .a(s3_c3_s), .b(pp[2][1]), .cin(pp[3][0]), .sum(s4_c3_s), .cout(s4_c3_c) );
fa s4_c4_fa ( .a(s3_c3_c), .b(s3_c4_s), .cin(pp[4][0]), .sum(s4_c4_s), .cout(s4_c4_c) );
fa s4_c5_fa ( .a(s3_c4_c), .b(s3_c5_s), .cin(pp[5][0]), .sum(s4_c5_s), .cout(s4_c5_c) );
fa s4_c6_fa ( .a(s3_c5_c), .b(s3_c6_s), .cin(s2_c6_s2), .sum(s4_c6_s), .cout(s4_c6_c) );
fa s4_c7_fa ( .a(s3_c6_c), .b(s3_c7_s), .cin(s2_c7_s2), .sum(s4_c7_s), .cout(s4_c7_c) );
fa s4_c8_fa ( .a(s3_c7_c), .b(s3_c8_s), .cin(s2_c8_s2), .sum(s4_c8_s), .cout(s4_c8_c) );
fa s4_c9_fa ( .a(s3_c8_c), .b(s3_c9_s), .cin(s2_c9_s2), .sum(s4_c9_s), .cout(s4_c9_c) );
fa s4_c10_fa( .a(s3_c9_c), .b(s3_c10_s), .cin(s2_c10_s2), .sum(s4_c10_s), .cout(s4_c10_c) );
fa s4_c11_fa( .a(s3_c10_c), .b(s3_c11_s), .cin(pp[7][4]), .sum(s4_c11_s), .cout(s4_c11_c) );
fa s4_c12_fa( .a(s3_c11_c), .b(s3_c12_s), .cin(pp[7][5]), .sum(s4_c12_s), .cout(s4_c12_c) );
fa s4_c13_fa( .a(s3_c12_c), .b(pp[6][7]), .cin(pp[7][6]), .sum(s4_c13_s), .cout(s4_c13_c) );


// STAGE 5: Final Carry Propagate Addition 

// We now have exactly 2 rows of bits to add together.
wire [15:0] op1, op2;

assign op1 = {1'b0, pp[7][7], s4_c13_s, s4_c12_s, s4_c11_s, s4_c10_s, s4_c9_s, s4_c8_s, 
              s4_c7_s, s4_c6_s, s4_c5_s, s4_c4_s, s4_c3_s, s4_c2_s, pp[0][1], pp[0][0]};

assign op2 = {1'b0, s4_c13_c, s4_c12_c, s4_c11_c, s4_c10_c, s4_c9_c, s4_c8_c, s4_c7_c, 
              s4_c6_c, s4_c5_c, s4_c4_c, s4_c3_c, s4_c2_c, pp[2][0], pp[1][0], 1'b0};

assign P = op1 + op2;

endmodule

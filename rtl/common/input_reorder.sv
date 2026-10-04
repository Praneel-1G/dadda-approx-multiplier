// 4 bit input reordering circuit 
module input_reorder(
    input wire A , B , C , D,
    output wire X1 , X2 , X3 , X4
);
// X1 is 1 if AT LEAST ONE input is 1
    assign X1 = A | B | C | D;

    // X2 is 1 if AT LEAST TWO inputs are 1
    assign X2 = (A & B) | (A & C) | (A & D) | (B & C) | (B & D) | (C & D);

    // X3 is 1 if AT LEAST THREE inputs are 1
    assign X3 = (A & B & C) | (A & B & D) | (A & C & D) | (B & C & D);

    // X4 is 1 if ALL FOUR inputs are 1
    assign X4 = A & B & C & D;

endmodule
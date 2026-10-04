  module exact4_2_comp (
    input wire x1, x2, x3, x4,
    input wire cin,
    output wire carry, cout, sum
);
    wire xi;
    fa fa1(.a(x1), .b(x2), .cin(x3), .sum(xi), .cout(cout));
    
    fa fa2(.a(x4), .b(xi), .cin(cin), .sum(sum), .cout(carry));
endmodule
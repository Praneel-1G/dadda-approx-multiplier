`timescale 1ns/1ps
module gate_tb;
  reg [7:0] A;
  reg [7:0] B;
  wire [15:0] P;
  integer i, j;
  integer err;
  integer diff;
  integer expected_P;
  integer MAX_TOLERANCE = 2048; 

  approx_dadda_d1 dut (.A(A), .B(B), .P(P));
  initial begin
    err = 0;
    A = 0;
    B = 0;
    $dumpfile("gate_activity.vcd");
    $dumpvars(0, gate_tb);
    for (i = 0; i < 256; i = i + 1) begin
      for (j = 0; j < 256; j = j + 1) begin
        A = i;
        B = j;
        #1;
        
        // Calculate using loop integers to force a 32-bit context
        expected_P = i * j;
        diff = expected_P > P ? expected_P - P : P - expected_P;
        
        if (diff > MAX_TOLERANCE) begin
          err = err + 1;
          if (err <= 10)
            $display("ERROR A=%0d B=%0d expected=%0d got=%0d diff=%0d", A, B, expected_P, P, diff);
        end
      end
    end
    $display("GATE_VERIFY_VECTORS=65536");
    $display("GATE_VERIFY_ERRORS=%0d", err);
    if (err != 0)
      $fatal(1, "Gate-level verification failed");
    $finish;
  end
endmodule

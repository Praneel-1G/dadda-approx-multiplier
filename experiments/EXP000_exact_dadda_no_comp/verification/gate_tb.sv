`timescale 1ns/1ps
module tb_gate_exact_dadda_no_comp;
  reg [7:0] A;
  reg [7:0] B;
  wire [15:0] P;
  integer i, j;
  integer err;
  exact_dadda_no_comp dut (.A(A), .B(B), .P(P));
  initial begin
    err = 0;
    A = 0;
    B = 0;
    $dumpfile("gate_activity.vcd");
    $dumpvars(0, tb_gate_exact_dadda_no_comp);
    for (i = 0; i < 256; i = i + 1) begin
      for (j = 0; j < 256; j = j + 1) begin
        A = i;
        B = j;
        #1;
        if (P !== (A * B)) begin
          err = err + 1;
          if (err <= 10)
            $display("ERROR A=%0d B=%0d expected=%0d got=%0d", A, B, A * B, P);
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

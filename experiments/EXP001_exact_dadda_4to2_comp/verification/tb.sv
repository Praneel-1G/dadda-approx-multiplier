`timescale 1ns / 1ps

module tb_exact_dadda_with_compressor();
    logic [7:0] A;
    logic [7:0] B;
    logic [15:0] P;
    logic [15:0] expected_P;
    int error_count;
    int pass_count;

    exact_dadda_with_compressor #(.WIDTH(8)) dut (
        .A(A), .B(B), .P(P)
    );

    initial begin
        error_count = 0;
        pass_count = 0;
        A = '0;
        B = '0;

        for (int i = 0; i < 256; i++) begin
            for (int j = 0; j < 256; j++) begin
                A = i[7:0];
                B = j[7:0];
                expected_P = A * B;
                #1;
                if (P !== expected_P) begin
                    error_count++;
                    if (error_count <= 10) begin
                        $display("ERROR A=%0d B=%0d expected=%0d got=%0d", A, B, expected_P, P);
                    end
                end else begin
                    pass_count++;
                end
            end
        end

        $display("RTL_VERIFY_VECTORS=%0d", pass_count + error_count);
        $display("RTL_VERIFY_PASSES=%0d", pass_count);
        $display("RTL_VERIFY_ERRORS=%0d", error_count);

        if (error_count != 0 || pass_count != 65536) begin
            $fatal(1, "RTL verification failed");
        end
        $finish;
    end

    initial begin
        $dumpfile("rtl_activity.vcd");
        $dumpvars(0, tb_exact_dadda_with_compressor.dut);
    end
endmodule

`timescale 1ns / 1ps

module tb_exact_dadda_without_compressor();

    // -----------------------------------------
    // Signal Declarations
    // -----------------------------------------
    logic [7:0] A;
    logic [7:0] B;
    logic [15:0] P;
    
    logic [15:0] expected_P;
    
    int error_count;
    int pass_count;

    // -----------------------------------------
    // Device Under Test (DUT) Instantiation
    // -----------------------------------------
    exact_dadda_no_comp #(
        .WIDTH(8)
    ) dut (
        .A(A),
        .B(B),
        .P(P)
    );

    // -----------------------------------------
    // Exhaustive Stimulus & Checker Block
    // -----------------------------------------
    initial begin
        // Initialize counters
        error_count = 0;
        pass_count = 0;
        
        $display("==================================================");
        $display("Starting Exhaustive Verification...");
        $display("Design: 8x8 Dadda Multiplier without 4:2 Compressors");
        $display("Total vectors to test: 65,536");
        $display("==================================================");

        // Iterate through all possible values of A (0 to 255)
        for (int i = 0; i < 256; i++) begin
            
            // Iterate through all possible values of B (0 to 255)
            for (int j = 0; j < 256; j++) begin
                
                // Apply stimulus
                A = i[7:0];
                B = j[7:0];
                
                // Calculate expected theoretical result
                expected_P = A * B;
                
                // Wait for combinational delays to settle
                #1; 
                
                // Self-Checking Assertion
                if (P !== expected_P) begin
                    $display("ERROR at time %0t: A = %3d (0x%h), B = %3d (0x%h)", $time, A, A, B, B);
                    $display("  -> Expected: %5d (0x%h)", expected_P, expected_P);
                    $display("  -> Actual:   %5d (0x%h)", P, P);
                    error_count++;
                end else begin
                    pass_count++;
                end
                
            end
        end

        // -----------------------------------------
        // Final Verification Summary
        // -----------------------------------------
        $display("\n==================================================");
        $display("Verification Complete!");
        $display("==================================================");
        $display("Total Tests Run : %0d", (pass_count + error_count));
        $display("Passed Vectors  : %0d", pass_count);
        $display("Failed Vectors  : %0d", error_count);
        $display("==================================================");
        
        if (error_count == 0) begin
            $display("SUCCESS: The multiplier is 100%% logically correct!");
        end else begin
            $display("FAILURE: The multiplier contains logical errors.");
        end
        $display("==================================================");

        // End simulation
        $finish;
    end

    initial begin
        $dumpfile("activity_no_comp.vcd");
        // Dump the exact module name and instance name you used
        $dumpvars(0, tb_exact_dadda_without_compressor.dut); 
    end

endmodule
module tb;
    // Input and Output signals
    logic [7:0]  A, B;
    logic [15:0] P_approx;
    logic [15:0] P_exact;

    // Instantiate the Device Under Test (DUT)
    // Replace 'approx_dadda_with_d1' with your top-level module name if different
    approx_dadda_d1 dut (
        .A(A), 
        .B(B),
        .P(P_approx)
    );

    // Baseline counters
    longint unsigned N = 65536;
    longint unsigned N_nz = 0;      // Count of non-zero exact outputs
    longint unsigned N_error = 0;   // Count of incorrect outputs
    
    // Accumulators for Absolute and Squared Errors
    longint unsigned abs_E = 0;
    longint unsigned sum_abs_E = 0;
    longint unsigned sum_sq_E = 0;
    longint unsigned WCE = 0;       // Worst-Case Error
    
    // Real numbers for Relative Error precision
    real RE = 0.0;
    real sum_RE = 0.0;
    real MaxRE = 0.0;

    // Final Metric Variables
    real ER, MAE, MSE, MRE;

    initial begin
        // Sweep all 65,536 possible 8x8 input combinations
        for (int i = 0; i < 256; i++) begin
            for (int j = 0; j < 256; j++) begin
                A = i;
                B = j;
                #1; // 1 time-step delay for combinational logic propagation

                P_exact = A * B;

                // 1. Calculate Absolute Error (|E_i|)
                // Uses an if-else block to prevent 2's complement underflow
                if (P_approx > P_exact) begin
                    abs_E = P_approx - P_exact;
                end else begin
                    abs_E = P_exact - P_approx;
                end

                // 2. Track Error Count (N_error)
                if (abs_E != 0) begin
                    N_error++;
                end

                // 3. Accumulate values for MAE and MSE
                sum_abs_E += abs_E;
                sum_sq_E += (abs_E * abs_E);

                // 4. Track Worst-Case Error (WCE = max |E_i|)
                if (abs_E > WCE) begin
                    WCE = abs_E;
                end

                // 5. Calculate Relative Error Metrics
                // Checked against N_nz to strictly avoid division by zero
                if (P_exact != 0) begin
                    N_nz++;
                    RE = real'(abs_E) / real'(P_exact);
                    sum_RE += RE;
                    
                    if (RE > MaxRE) begin
                        MaxRE = RE;
                    end
                end
            end
        end

        // Compute final averages using explicit real casting
        ER  = real'(N_error) / real'(N);
        MAE = real'(sum_abs_E) / real'(N);
        MSE = real'(sum_sq_E) / real'(N);
        MRE = sum_RE / real'(N_nz);

        // Print formatted output to terminal
        $display("==================================================");
        $display("      APPROXIMATE MULTIPLIER ERROR METRICS        ");
        $display("==================================================");
        $display("Total Combinations (N)       : %0d", N);
        $display("Non-Zero Exact Outputs (Nnz) : %0d", N_nz);
        $display("Error Count (N_error)        : %0d", N_error);
        $display("--------------------------------------------------");
        $display("Error Rate (ER)              : %0f", ER);
        $display("Mean Absolute Error (MAE)    : %0f", MAE);
        $display("Mean Squared Error (MSE)     : %0f", MSE);
        $display("Worst-Case Error (WCE)       : %0d", WCE);
        $display("Mean Relative Error (MRE)    : %0f", MRE);
        $display("Maximum Relative Error(MaxRE): %0f", MaxRE);
        $display("==================================================");

        $finish;
    end

    initial begin
        $dumpfile("rtl_activity.vcd");
        $dumpvars(0, tb.dut);
    end
endmodule
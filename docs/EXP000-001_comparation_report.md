# Experimental Comparison: Exact 8-bit Dadda Multiplier (Baseline vs. Compressor)

## 1. Executive Summary
This report evaluates the physical design metrics of two exact 8-bit Dadda multiplier architectures implemented on the Skywater 130nm High-Density (sky130hd) standard cell library. The objective is to establish a high-efficiency exact baseline before introducing approximation techniques. 

The two evaluated designs are:
*   **EXP000:** Exact Dadda Multiplier (Standard partial product reduction without structural compressors).
*   **EXP001:** Exact Dadda Multiplier (With structural exact compressors).

**Conclusion:** The baseline exact Dadda multiplier (EXP000) strictly outperforms the compressor-based variant (EXP001) across Area, Delay, and Power. EXP000 is the recommended baseline for future approximate multiplier comparisons.

---

## 2. Experimental Setup
*   **Target Platform:** OpenROAD Flow Scripts (ORFS) / sky130hd
*   **Liberty/PVT:** `sky130_fd_sc_hd__tt_025C_1v80.lib`
*   **Data Width:** 8-bit input, 16-bit output
*   **Target Clock:** 2.000 ns (500 MHz)

---

## 3. Functional Verification
Both designs were simulated against exhaustive vectors (65,536 input pairs) with full RTL and Gate-level VCD tracking. 
*   **Functional Correctness:** **PASS** (100% accurate for both designs)
*   **Error Rate / MAE / MSE:** 0 (Both designs are perfectly exact)

---

## 4. PPA (Power, Performance, Area) Comparison

| Metric | EXP000 (No Compressor) | EXP001 (With Compressor) | Delta (EXP001 vs EXP000) |
| :--- | :--- | :--- | :--- |
| **Cell Count** | 185 | 192 | +7 cells (+3.8%) |
| **Area** | 1807.98 µm² | 1875.55 µm² | +67.57 µm² (+3.7%) |
| **Critical Path (Delay)** | 3.6160 ns | 3.8999 ns | +0.2839 ns (+7.8%) |
| **Fmax** | 276.55 MHz | 256.42 MHz | -20.13 MHz |
| **WNS** *(Target: 2.0ns)* | -1.62 ns | -1.90 ns | Worse by 0.28 ns |
| **Total Power** *(VCD)* | 1.7892 mW | 1.8995 mW | +0.1103 mW (+6.2%) |
| **Leakage Power** *(VCD)* | 1.41 nW | 1.45 nW | +0.04 nW |
| **PDP** *(VCD x Delay)* | 6.4698 pJ | 7.4078 pJ | +0.9380 pJ (+14.5%) |

---

## 5. Architectural Analysis

1.  **Timing & Performance Degradation:** 
    Neither design meets the aggressive 2.0 ns target clock. However, enforcing a structural compressor hierarchy (EXP001) extended the critical path by nearly 0.3 ns. For an 8-bit multiplier, the partial product reduction tree is relatively shallow, meaning the physical routing and standard-cell delays of the structural compressors outweighed their theoretical logic-level advantages.
2.  **Synthesis Optimization Constraints:**
    The traditional Dadda tree (EXP000) allowed the synthesis tool (Yosys) maximum freedom to flatten the logic cone and optimize boolean mapping across the entire reduction tree. The compressor variant restricted this freedom, resulting in a larger footprint (+3.7% area) and higher cell count.
3.  **Power Inefficiency:**
    Driven by the increased cell count and longer timing paths, the total VCD-annotated power consumption of the compressor variant was 6.2% higher. Combined with the slower operational speed, the Power-Delay Product (PDP) of the exact compressor variant degraded by 14.5% compared to the baseline.

## 6. Next Steps for Research
Because `exact_dadda_no_comp` (EXP000) offers superior PPA metrics, it is confirmed as the definitive exact baseline for this study. Future approximate architectures (e.g., approximate 4:2 compressors) must demonstrate significant logical simplification to undercut the 1807 µm² area and 1.78 mW power consumption of this highly optimized exact baseline.
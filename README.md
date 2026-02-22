# High-Frequency-Circuits-and-Trasmission-Lines-Projects

This folder contains the analytical study, MATLAB simulations, and optimization strategies for **Part A** of the High-Frequency Devices course (ECE AUTh). The project focuses on transmission line theory, impedance matching, and broadband optimization using evolutionary algorithms.

## 📘 Part A: Transmission Lines & Impedance Matching

### 🔍 Scientific Analysis & Insights

#### 1. Network Characterization (Ex. 1.2)
Analysis of complex distributed networks using S-parameters and Standing Wave Ratio (SWR). The project evaluates how frequency variations (0-4 GHz) affect the reflection coefficient in circuits with mixed lumped and distributed elements.

#### 2. Stepped-Impedance Microstrip Filter (Ex. 1.2c)
Design and simulation of a 5-section Low-Pass Filter (LPF) utilizing alternating high ($Z_H$) and low ($Z_L$) characteristic impedances. The results validate the stopband rejection levels and the accuracy of the physical length calculations.



#### 3. Impedance Matching Topologies (Ex. 1.3)
Comparative study of three matching solutions for a generator ($Z_g = 50-40j$) and load ($Z_L = 10+15j$) at 1 GHz:
* **Case A:** Shunt capacitor at input ($C=3.09\text{ pF}, l=0.0111\text{ m}$).
* **Case B:** Shunt capacitor at load ($C=4.77\text{ pF}, l=0.03\text{ m}$).
* **Case C:** Series capacitor at input ($C=2.89\text{ pF}, l=0.0414\text{ m}$).

**Finding:** All topologies achieve maximum power transfer at the design frequency, but exhibit different frequency stability (bandwidth) characteristics.

#### 4. Broadband Optimization via JAYA Algorithm (Ex. 1.4)
The core of the project involves the optimization of a **Triple-Stub Tuner** to achieve broadband matching using the **JAYA Algorithm** (Population: 1000, Iterations: 3000).



**Key Performance Results:**
* **Scenario 1 ($Z_L = 120 + 60j$, Range $0.5-1.5 f_0$):**
    * Initial mean $|\Gamma_{in}| = 0.3870$.
    * Optimized vector: $p = [0.2334, 0.0815, 0.1487, 0.4784, 0.1167, 0.0500]$.
* **Scenario 2 ($Z_L = 120 + 60j$, Range $0.01-2.0 f_0$):**
    * Optimized vector: $p = [0.2209, 0.1125, 0.1246, 0.085, 0.0823, 0.0500]$.
    * Mean $|\Gamma_{in}| = 0.4702$. Effective matching achieved between **1.54 - 1.97 GHz**.
* **Scenario 3 (Load Sensitivity):**
    * For **$Z_L = 20 + j30$**: Mean $|\Gamma_{in}| = 0.4747$. Narrow match window (1.76-1.91 GHz).
    * For **$Z_L = 180 - j20$**: Mean $|\Gamma_{in}| = 0.7254$. Physical limitation reached; broadband matching was not feasible for this specific high-impedance load over the large bandwidth.

### 💻 MATLAB Source Code Mapping

| File | Context | Description |
| :--- | :--- | :--- |
| `res1.m` | Ex. 1.2a | Frequency response and $|\Gamma|$ plots. |
| `res2.m` | Ex. 1.2b | SWR and Return Loss analysis. |
| `res3.m` | Ex. 1.2c | Microstrip Filter simulation. |
| `res4a.m` | Ex. 1.3γ | Power transfer (Shunt Matching). |
| `res4b.m` | Ex. 1.3γ | Power transfer (Series Matching). |
| `res6.m` | Ex. 1.4 | Objective function for JAYA optimization. |
| `CalcZin.m`| Utility | Recursive impedance transformation function. |

> **Note:** To reproduce specific results from Scenarios 2 & 3, the `normf` and `zl` variables inside `res6.m` must be adjusted to match the parameters described in the technical report.

---

### 📂 Technical Documentation
Detailed mathematical derivations, Smith Charts, and optimization convergence plots are available in the technical report:
👉 [Technical_Report_Part_A.pdf](Part_A/docs/Report_A.pdf)

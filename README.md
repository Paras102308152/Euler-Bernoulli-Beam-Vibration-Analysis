# Euler-Bernoulli Beam Vibration Analysis

This project examines the transverse vibration of a slender beam using the Euler–Bernoulli theory under pinned-slider boundary conditions.

---

## 📌 Project Overview

This project presents an analytical and numerical free vibration analysis of a uniform slender beam subjected to **pinned-slider boundary conditions**. The study derives governing differential equations using Euler–Bernoulli beam theory, calculates natural frequencies and mode shapes analytically via MATLAB, and validates the formulation using a 3D Finite Element Method (FEM) modal analysis in **ANSYS Mechanical**.

---

## 📐 System Specifications & Boundary Conditions

* **Beam Dimensions:** Length $L = 0.5\text{ m}$, Cross-section $b \times h = 20 \times 20\text{ mm}$
* **Material Properties:** Structural Steel ($E = 210\text{ GPa}$, $\rho = 7850\text{ kg/m}^3$)
* **Left Boundary (Pinned Support, $x=0$):** Zero displacement $w(0)=0$, zero bending moment $w''(0)=0$
* **Right Boundary (Vertical Slider Support, $x=L$):** Zero slope $w'(L)=0$, zero shear force $w'''(L)=0$

---

## 🔬 Analytical vs. FEA Results Comparison

| Mode | Analytical Frequency (Hz) | ANSYS FEA Frequency (Hz) | Relative Error (%) |
| ---- | ------------------------: | -----------------------: | -----------------: |
| 1    |                     45.78 |                   45.794 |              0.03% |
| 2    |                    412.01 |                   410.01 |              0.49% |
| 3    |                   1144.92 |                  1127.30 |              1.54% |

---


---

## 🛠️ Key Technical Takeaways & Discussion

1. **High Agreement:** FEA results matched analytical calculations within **1.54% max error**, validating both theoretical modeling and mesh refinement (5 mm element body sizing).

2. **Discrepancy Analysis in Higher Modes:**

   * **Boundary Idealization:** Physical constraints in ANSYS introduce slight artificial stiffness compared to a frictionless theoretical slider.
   * **3D Effects:** Euler–Bernoulli 1D beam theory ignores shear deformation and rotary inertia, whereas ANSYS models 3D volume effects that become noticeable at higher mode wavelengths.
   * **Parasitic Modes:** 3D FEA captures coupled lateral/torsional modes alongside purely transverse modes.

---

## 💻 MATLAB Code

The spatial mode shapes $W_n(x) = \sin(\beta_n x)$ were plotted using MATLAB:

```matlab
L = 0.5;
x = linspace(0,L,1000);
beta1 = pi;
beta2 = 3*pi;
beta3 = 5*pi;
w1 = sin(beta1*x);
w2 = sin(beta2*x);
w3 = sin(beta3*x);
w1 = w1./max(abs(w1));
w2 = w2./max(abs(w2));
w3 = w3./max(abs(w3));
subplot(3,1,1)
plot(x,w1)
ylabel('W_1(x)')
title('Mode 1')
subplot(3,1,2)
plot(x,w2)
ylabel('W_2(x)')
title('Mode 2')
subplot(3,1,3)
plot(x,w3)
xlabel('x')
ylabel('W_3(x)')
title('Mode 3')
```

---

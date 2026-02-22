function res4c()
Zo = 50;
Z_L = 10 + 15j;
V_g = 1;
Z_g = 50 - 40j; 
fo = 1;
f = 0 : 0.01 * fo : 2 * fo;
lambda_3 = 0.1;
C3 = 4.77; 
X_c_3 = -1j * 1 ./ (2 * pi * f * 1e9 * C3 * 1e-12);

Z_L_3 = (Z_L .* X_c_3)./ (Z_L + X_c_3);

b_l_3 = lambda_3 * 2 * pi * f / fo;
Z_in_3 = Zo * (Z_L_3 + 1j .* Zo .* tan(b_l_3)) ./ (Zo + 1j .* Z_L_3 .* tan(b_l_3));
x_in_3 = real(Z_in_3);

I_in_3 = V_g ./ (Z_in_3 + Z_g);

I_in_3_norm = abs(I_in_3);

power_3 = x_in_3 .* I_in_3_norm.^2;

figure
plot(f, power_3*1e3)
title("γ3) Πυκνωτής παράλληλα στο φορτίο")
xlabel("Frequency (GHz)")
ylabel("P (mW)")

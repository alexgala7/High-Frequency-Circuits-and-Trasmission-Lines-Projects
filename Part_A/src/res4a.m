function res4a()
Zo = 50;
Z_L = 10 + 15j;
V_g = 1;
Z_g = 50 - 40j; 
fo = 1;
f = 0 : 0.01 * fo : 2 * fo;
lambda_1 = 0.037;
C1 = 3.09;
X_c_1 = -1j * 1 ./ (2 * pi * f * 1e9 * C1 * 1e-12);

b_l_1 = lambda_1 * 2 * pi * f / fo;
Z_a_1 = Zo * (Z_L + 1j .* Zo .* tan(b_l_1)) ./ (Zo + 1j .* Z_L .* tan(b_l_1));

Z_in_1 = (Z_a_1 .* X_c_1) ./ (Z_a_1 + X_c_1);
x_in_1 = real(Z_in_1);

I_in_1 = V_g ./ (Z_in_1 + Z_g);

I_in_1_norm = abs(I_in_1);

power_1 = x_in_1 .* I_in_1_norm.^2;

figure
plot(f, power_1*1e3)
title("γ1) Πυκνωτής παράλληλα στην είσοδο")
xlabel("Frequency (GHz)")
ylabel("P (mW)")
end

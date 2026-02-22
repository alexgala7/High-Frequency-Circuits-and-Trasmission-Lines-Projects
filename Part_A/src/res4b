function res4b()
Zo = 50;
Z_L = 10 + 15j;
V_g = 1;
Z_g = 50 - 40j; 
fo = 1;
f = 0 : 0.01 * fo : 2 * fo;
lambda_2 = 0.138;
C2 = 2.89;
X_c_2 = -1j * 1 ./ (2 * pi * f * 1e9 * C2 * 1e-12);

b_l_2 = lambda_2 * 2 * pi * f / fo;
Z_a_2 = Zo * (Z_L + 1j .* Zo .* tan(b_l_2)) ./ (Zo + 1j .* Z_L .* tan(b_l_2));

Z_in_2 = Z_a_2 + X_c_2;
x_in_2 = real(Z_in_2);

I_in_2 = V_g ./ (Z_in_2 + Z_g);

I_in_2_norm = abs(I_in_2);

power_2 = x_in_2 .* I_in_2_norm.^2;

figure
plot(f, power_2*1e3)
title("γ2) Πυκνωτής σε σειρά στην είσοδο")
xlabel("Frequency (GHz)")
ylabel("P (mW)")
end

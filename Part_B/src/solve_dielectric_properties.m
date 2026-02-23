function [epsilon_r_solution, tan_delta_solution] = solve_dielectric_properties()

% Δεδομένα
f = 10e9; % Συχνότητα σε Hz
hta0 = 120*pi; 
c0 = 3e8; % Ταχύτητα του φωτός σε m/s
omega = 2*pi*f; % Γωνιακή ταχύτητα σε r/s
lambda0 = c0 / f ; % m
a = 2.286e-2; % πλάτος κυματοδηγού σε m
d = 1.5e-3; % πάχος δειγμάτων σε m
L = 0.06; % Μήκος κυματοδηγού
Zin_1 = 4.9678 + 1j*43.9439; % Σύνθετη κυματική αντίσταση για πάχος d
Zin_2 = 108.5347 + 1j*202.0158; % Σύνθετη κυματική αντίσταση για πάχος 2d
kc = pi/a; % Κυματικός αριθμός αποκοπής
m0 = 4*pi*10^(-7); % Μαγνητική διαπερατότητα κενού σε H/m
e0 = 1/(m0*c0^2); % Διηλεκτρική σταθερά κενού σε F*m-1

l1 = d; % Μήκος 1ης περίτπωσης
l2 = 2*d; % Μήκος 2ης περίπτωσης


% Χωρίς διηλεκτρικό
fc0 = c0 / (2*pi) * (pi / a); % Συχνότητα αποκοπής επικρατέστερου ρυθμού (ΤΕ10) σε Hz
Z0 = hta0 / (sqrt(1 - (fc0 / f)^2));
beta0 = 2 * pi * f / c0 * sqrt(1 - (fc0 / f)^2);

ZA_1 = Z0 * (Zin_1 - 1j * Z0 * tan(beta0*(L-l1))) / (Z0 - 1j * Zin_1 * tan(beta0*(L-l1))); % Αντίσταση εισόδου του βραχυκυκλωμένου διηλεκτρικού τμήματος μήκους d
ZA_2 = Z0 * (Zin_2 - 1j * Z0 * tan(beta0*(L-l2))) / (Z0 - 1j * Zin_2 * tan(beta0*(L-l2))); % Αντίσταση εισόδου του βραχυκυκλωμένου διηλεκτρικού τμήματος μήκους 2d

k = 2 * (ZA_1 / ZA_2) - 1;

% Λύση (tanhx)^2 = k 
syms x; 
eqn = tanh(x)^2 == k;
sol = solve(eqn, x);
sol_x = subs(x, sol);
sol_x = vpa(sol_x);

a1 = abs(real(sol_x(1))) / d;
b1 = abs(imag(sol_x(1))) / d;

gamma1 = a1 + 1j*b1;

epsilon_r = (b1^2 + kc^2) / (omega^2 * m0 * e0)
kapa_tetragono = (omega^2 * m0 * e0) * epsilon_r;
kapa = sqrt(kapa_tetragono);
tand = (2*a1*b1) / (kapa^2)
    
end

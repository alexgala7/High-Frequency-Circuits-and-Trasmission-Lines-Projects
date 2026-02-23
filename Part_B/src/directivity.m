function [D] = directivity(d)
    % Δεδομένα
    l = 0.3; % Μήκος κύματος (λ)
    h0 = 120 * pi; % Σταθερά για την πυκνότητα ισχύος
    ia = 1; % Ρεύμα (I)
    
    % Ορισμός των γωνιών θ και φ
    phi = 0:(2*pi)/360:2*pi; % 0 έως 2π με βήμα 1 μοίρα
    theta = 0:(pi)/180:pi; % 0 έως π με βήμα 1 μοίρα
    
    % Παράμετροι για το κύμα
    k = 2*pi/l; % Αριθμός κύματος (k)
    k2 = k * d / 2; % Παράμετρος kk
    
    % Αρχικοποίηση πίνακα για το παρανομαστή του ολοκληρώματος
    paronom = zeros(length(phi), length(theta));
   % Υπολογισμός του παρανομαστή
        for j = 1:length(theta)
            paronom(i, j) = (h0 * ia^2 / (8 * pi^2)) * ...
                            (sin(theta(j))^2) * ...
                            (cos(k2 * cos(phi(i)) * sin(theta(j))) + ...
                             cos(k2 * 3 * cos(phi(i)) * sin(theta(j))) + ...
                             cos(k2 * 5 * cos(phi(i)) * sin(theta(j))) + ...
                             cos(k2 * 7 * cos(phi(i)) * sin(theta(j))))^2;
        end
    end
    
    % Άθροισμα παρανομαστή
    par = sum(sum(paronom));
    
    % Εύρεση αριθμητικής τιμής για το άθροισμα
    arith = max(max(paronom));
    
    % Υπολογισμός κατευθυντικότητας
    D = 361 * 181 * arith / par;
end

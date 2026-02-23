function double_stub_tuning()
    % Δεδομένα
    Z0 = 50; % Χαρακτηριστική αντίσταση γραμμής μεταφοράς (Ω)
    f0 = 5e9; % Κεντρική συχνότητα (Hz)
    c = 3e8; % Ταχύτητα του φωτός (m/s)
    lambda0 = c / f0; % Μήκος κύματος (m)
    ZL = 20 - 1j * 30; % Φορτίο (Ω)
    Y0 = 1 / Z0; % Χαρακτηριστική αγωγιμότητα γραμμής μεταφοράς (S)
    
    % Μετατροπή φορτίου σε αγωγιμότητα
    YL = 1 / ZL;

    % Συνάρτηση για την αγωγιμότητα εισόδου ενός κλαδωτή
    stub_admittance = @(l, f) 1j * Y0 * tan(2 * pi * f / c * l);
    
    % Συνάρτηση για την αγωγιμότητα εισόδου μιας γραμμής μήκους d
    input_admittance = @(Ya, d, f) Y0 * (Ya + 1j * Y0 * tan(2 * pi * f / c * d)) / (Y0 + 1j * Ya * tan(2 * pi * f / c * d));
    
    % Μήκος γραμμής μεταξύ των κλαδωτών
    d = lambda0 / 8;
    
    % Στόχος: Y_in = Y0
    % Δημιουργία ανώνυμης συνάρτησης για τη μη γραμμική εξίσωση
    equation_system = @(x) [
        imag(stub_admittance(x(1), f0) + input_admittance(YL + stub_admittance(x(2), f0), d, f0)) - imag(Y0)
        real(stub_admittance(x(1), f0) + input_admittance(YL + stub_admittance(x(2), f0), d, f0)) - real(Y0)
    ];
    
    % Αρχικές προσεγγίσεις για την εύρεση λύσεων
    initial_guesses = [0.01103, 0.00655; 0.02748, 0.02196];
    
    % Εύρεση λύσεων χρησιμοποιώντας τη συνάρτηση fsolve
    options = optimoptions('fsolve', 'Display', 'iter');
    solutions = zeros(size(initial_guesses));
    for i = 1:size(initial_guesses, 1)
        solutions(i, :) = fsolve(equation_system, initial_guesses(i, :), options);
    end
    
    % Εμφάνιση των λύσεων
    fprintf('Λύση 1: l1 = %.5f m, l2 = %.5f m\n', solutions(1, 1), solutions(1, 2));
    fprintf('Λύση 2: l1 = %.5f m, l2 = %.5f m\n', solutions(2, 1), solutions(2, 2));

    % Υπολογισμός και απεικόνιση του συντελεστή ανάκλασης για συχνότητες 0-10 GHz
    frequencies = linspace(0, 10e9, 1000);
    reflection_coefficients = zeros(2, length(frequencies));

    for i = 1:length(frequencies)
        f = frequencies(i);
        Ya1 = YL + stub_admittance(solutions(1, 2), f);
        YB1 = input_admittance(Ya1, d, f);
        Yin1 = stub_admittance(solutions(1, 1), f) + YB1;
        reflection_coefficients(1, i) = abs((Yin1 - Y0) / (Yin1 + Y0));
        
        Ya2 = YL + stub_admittance(solutions(2, 2), f);
        YB2 = input_admittance(Ya2, d, f);
        Yin2 = stub_admittance(solutions(2, 1), f) + YB2;
        reflection_coefficients(2, i) = abs((Yin2 - Y0) / (Yin2 + Y0));
    end

    % Δημιουργία γραφήματος
    figure;
    hold on;
    plot(frequencies / 1e9, reflection_coefficients(1, :), 'b', 'DisplayName', '|Γin| - Λύση 1');
    plot(frequencies / 1e9, reflection_coefficients(2, :), 'r', 'DisplayName', '|Γin| - Λύση 2');
    yline(0.316, 'k--', 'DisplayName', '|Γin| = 0.316');
    xlabel('Συχνότητα (GHz)');
    ylabel('|Γin|');
    title('Συντελεστής Ανάκλασης Εισόδου');
    legend('show');
    grid on;
    hold off;
end

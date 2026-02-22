function res3()
    c = 3e8;
    f0 = 1e9;
    N = 200;
    Z0 = 50;
    Zload = 50;
    ZH = 150 + 1i*0;
    ZL = 20 + 1i*0;
    f = 0:(2*f0/N):(2*f0);
    lambda = c./f;
    beta = 2*pi./lambda;
    l = [0.018 0.026 0.031]; % ο υπολογισμός των μηκών των γραμμών μεταφοράς έγινε στο χέρι


    Z1 = ZH.*(Zload + 1i*ZH.*tan(beta*l(1)))./(ZH + 1i*Zload.*tan(beta*l(1)));
    Z2 = ZL.*(Z1 + 1i*ZL.*tan(beta*l(2)))./(ZL + 1i*Z1.*tan(beta*l(2)));
    Z3 = ZH.*(Z2 + 1i*ZH.*tan(beta*l(3)))./(ZH + 1i*Z2.*tan(beta*l(3)));
    Z4 = ZL.*(Z3 + 1i*ZL.*tan(beta*l(2)))./(ZL + 1i*Z3.*tan(beta*l(2)));
    Zin = ZH.*(Z4 + 1i*ZH.*tan(beta*l(1)))./(ZH + 1i*Z4.*tan(beta*l(1)));

    Gamma = abs((Zin - Z0)./(Zin + Z0));
    Gamma_dB = 20*log10(Gamma);

    SWR = (1 + Gamma)./(1 - Gamma);

    figure(1);
    plot(f, Gamma_dB, 'b');
    title('Μέτρο συντελεστή ανάκλασης |Γ| σε dB');
    xlabel('Συχνότητα (Hz)');
    ylabel('|Γ| (dB)');
    grid on;
    ylim([-60, 0]);

    figure(2);
    plot(f, SWR, 'b');
    title('SWR')
    xlabel('Συχνότητα (Hz)');
    ylabel('SWR');
    grid on;
    ylim([1, 10]);
end

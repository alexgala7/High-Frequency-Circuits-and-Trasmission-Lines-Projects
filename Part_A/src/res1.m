function res1() 
    f0 = 5e9; 
    N = 201; 
    f = linspace(0, 10e9, N); % Συχνότητες από 0 έως 10 GHz
    res = zeros(N, 1); 
    
    for i = 1:N 
        res(i) = Circ1(50, f(i)); 
    end
    
    figure;
    plot(f / 1e9, res); 
    xlabel('Frequency (GHz)');
    ylabel('|Γin|'); 
    title('Reflection Coefficient Magnitude');
    grid on;
end

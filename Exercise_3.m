temp = [-80, -60, -40, -20, 0, 20, 40, 60] + 273.15;
row = [70, 85, 96, 110, 121, 134, 150, 163];

plot(temp, row, '*');


ft = fittype('a*((x)^n) + b', 'problem', 'n');
[fit_fn, fit_gof] = fit(temp', row', ft, 'StartPoint', [.5,1], 'problem', 1);

hold on;
plot(fit_fn, 'm');
title ('Temperature vs Rho');
xlabel('Temperature (K)');
ylabel('Rho (µΩ - cm)');
legend('Data');
text(210, 160, 'Rho = 0.7T - 70 (µΩ - cm)');
hold off;
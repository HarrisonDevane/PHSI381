load P381_expdecay.mat

errorbar(time_data, ydata, sigma, '*');
ft = fittype('a*cos(b*x - c)*exp(-f*x) + n*g', 'problem', 'n');
[fit_fn, fit_gof] = fit(time_data', ydata', ft, 'StartPoint', [0, 0, 0, 0, 0], 'problem', 1);

hold on;
plot(fit_fn, 'm');
text(1, -1.5, 'y = 2cos(6t + 0.02)*exp(-0.6t) + 0.01 units');
hold off;
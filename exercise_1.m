vol = [32.1, 27.8, 23.5, 19.3, 15.0, 12.8, 10.4] * 10^-3;
dis_sq = [2, 3, 4, 5, 6, 7, 8];
dis_m = dis_sq * (2.54 * 10^-3);

ft = fittype('a*((x)^n)', 'problem', 'n');
[fit_fn, fit_gof] = fit(vol', dis_m', ft, 'StartPoint', [0], 'problem', -1);

hold on;
plot(dis_m, vol, '*');
plot(fit_fn, 'm');
xlabel('Distance (m)');
ylabel('Voltage (V)');
title('Voltage vs distance');
legend('Data');

text (0.012, 0.03, 'V = 0.0002215/d');
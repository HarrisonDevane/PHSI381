m1 = [14.52, 14.41, 14.32] / 10;
measurements = [1, 2, 3];
length = 0.476;

t = mean(m1);
sd = sqrt(var(m1));
g = length / ((t/(2*pi))^2);



ft = fittype('a*(x-b)^n', 'problem', 'n');
[fit_fn, fit_gof] = fit(m1', measurements', ft, 'StartPoint', [1,1], 'problem', 0);

hold on;
plot(fit_fn, 'm');
hold off;

legend('Data', 'n=-2');
set(gca, 'FontSize', 12);
xlabel('measurements)', 'FontSize', 14);
ylabel('data', 'FontSize', 14);

fit_resid = m1 - fit_fn(measurements);
figure(2), plot(measurements, fit_resid, 'ro', 'MarkerSize', 6);

noise_std_dev = sqrt(var(fit_resid));
fit_coeffs = coeffvalues(fit_fn);
fit_conf = confint(fit_fn);
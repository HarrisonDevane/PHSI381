load census

plot(cdate, pop, 'o');
ft = fittype('a*(x-b)^n', 'problem', 'n');
fitoptions(ft);
[fit_fn, fit_gof] = fit(cdate, pop, ft, 'StartPoint', [1,1], 'problem', 2);

hold on;
plot(fit_fn, 'm');
hold off;

legend('Data', 'n=2');
set(gca, 'FontSize', 12);
xlabel('date (year ad)', 'FontSize', 14);
ylabel('data and best fit curve', 'FontSize', 14);

fit_resid = pop - fit_fn(cdate);
figure(2), plot(cdate, fit_resid, 'ro', 'MarkerSize', 6);

noise_std_dev = sqrt(var(fit_resid));
fit_coeffs = coeffvalues(fit_fn);
fit_conf = confint(fit_fn);

avec = linspace(fit_conf(1,1), fit_conf(2, 1));
bvec = linspace(fit_conf(1, 2), fit_conf(2, 2));
[aa, bb] = meshgrid(avec, bvec);
sos = zeros(size(aa));

for cnt = 1:length(aa(:))
    aval = aa(cnt);
    bval = bb(cnt);
    sos(cnt) = sum((pop - ft(aval, bval, 2, cdate)).^2);
end

figure(3)
mesh(avec, bvec, sos/noise_std_dev^2)

figure(4)
contour(avec, bvec, sos/noise_std_dev^2, min(min(sos/noise_std_dev^2)) + [1, 2, 3], 'LineWidth', 3);
xlabel('a', 'FontSize', 14);
ylabel('b', 'FontSize', 14);
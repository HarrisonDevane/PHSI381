input_power1000 = [2.1 1.49 0.87 0.185];
voltage1000 = [36 25 15 3];
RF1000 = [-66.13 -66.21 -66.36 -66.54];

RF1000W = 0.001 .* 10.^(RF1000 ./ 10)

plot(input_power1000, RF1000W, '*')
uf = @(x) 1.0 ./(1 + 9 * x.^2);

xin = linspace(-1, 1, 19+1);%xj interpolation points
xout = linspace(-1, 1, 500); %x evaluation points
fin = f(xin);

yout = lagrange_int(xout, xin, fin);

plot (xout, f(xout), 'green', xout, yout, 'blue')
set(gca, 'xlim', [-1 1], 'ylim', [0 1.2]);
grid on
str = sprintf('Lagrange Interpolation Plot with Uniform Points,  n= %d',length(xin)-1);
title(str);
legend('f(x)', 'P(x)')
xlabel('x-axis')
ylabel('y-axis')

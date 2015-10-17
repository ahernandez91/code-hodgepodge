f = @(x) 1.0 ./(1 + 9 * x.^2);

xin = linspace(-1, 1, 99+1);%xj interpolation points uniform
xout = linspace(-1, 1, 500); %x evaluation points
fin = f(xin);

yout1 = barycentric_int(xout, xin, fin);
yout2 = lagrange_int(xout, xin, fin);

semilogy(xout,1.0e-18+abs(yout1-f(xout)), 'green', xout, 1.0e-18+abs(yout2-f(xout)), 'blue', 'linewidth', 1)
grid on
str = sprintf('Semilog Plot of Barycentric Interpolation vs Lagrange Interpolation with Uniform Points,  n= %d',length(xin)-1);
title(str);
legend('P(x) Barycentric', 'P(x) Lagrange' )
xlabel('x-axis')
ylabel('y-axis')
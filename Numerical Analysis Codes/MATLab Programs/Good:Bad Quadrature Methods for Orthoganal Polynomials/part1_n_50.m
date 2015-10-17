n=50;
a = zeros(1,n); 
b = [2,(1:n).^2./(4*(1:n).^2-1)];
x = cos(linspace(-pi,0,10*n));
phi_values = part1script(a, b, x);


plot(x, phi_values(n+1, 1:length(x)));
grid on
str = sprintf('Part 1 Plot of Polynomial Recursion (Good Method),  n= %d',n);
title(str);
xlabel('x-axis')
ylabel('y-axis')
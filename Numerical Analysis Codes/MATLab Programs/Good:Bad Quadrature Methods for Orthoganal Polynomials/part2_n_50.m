n = 50;
x = cos(linspace(-pi, 0, 500));
a = zeros(1, n);
b = [2, [1:n].^2./(4*[1:n].^2-1)]; 

S = part2badscript(a, b);

y = polyval(S(n+1,[1:n+1]),x);

plot(x, y);
grid on
str = sprintf('Part 2 Plot of Polynomial Recusion (Bad Method),  n= %d',n);
title(str);
xlabel('x-axis')
ylabel('y-axis')
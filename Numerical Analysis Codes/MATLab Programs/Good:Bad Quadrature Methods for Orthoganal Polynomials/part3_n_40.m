n = 40;
a = zeros(1, n);
b = [2, (1:n).^2./(4*(1:n).^2-1)];



[x, w, E] = part3script(a, b);
disp('Abscissas');
for i = 1:n
    disp(sprintf('x%d = %f', i, x(i)));
end
disp(' ');
disp('Weights');

for i = 1:n
    disp(sprintf('w%d = %f', i, w(i)));
end
disp(' ')
disp('Errors');
for i = 1:2*n+1
    disp(sprintf('E%d = %f', i, E(i)));
end

fcn_norm = norm(E(1:80));
disp(['Norm = ' mat2str(fcn_norm)]);
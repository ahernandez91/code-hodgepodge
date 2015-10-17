function [L, D, Lt] = ldlfactor(n, A)
L = eye(n);
D = eye(n);
v = zeros(1, n-1);
for i = 1:n
    for j = 1: i-1
        v(j) = L(i, j)* D(j, j);
    end
    D(i, i) = A(i, i) - sum(L(i, 1:i-1)*v(1:i-1)');
    for j = i + 1:n
        L(j, i) = (A(j, i) - sum(L(j, 1:i-1)*v(1:i-1)'))/D(i, i);
    end
    Lt =L';
end

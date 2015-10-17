function [L, LT] = cholesky(n, A)
    L = eye(n);
    L(1, 1) = sqrt(A(1, 1));
    for j = 2: n
        L(j, 1) = A(j, 1)/L(1, 1);
    end
    for i = 2:n-1
        L(i, i) = (A(i, i) - sum((L(i, 1:i-1)).^2))^(1/2);
        for j = i + 1: n
            L(j, i) = (A(j, i) - sum(L(j, 1:i-1)*L(i, 1:i-1)))/L(i, i);
        end
    end
    L(n, n) = (A(n, n) - sum((L(n, 1:n-1)).^2))^(1/2);
    LT = L';
end
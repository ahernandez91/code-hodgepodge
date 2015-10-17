function x_values = gauss(n, A)
    x_values = zeros(1, n);
    for i = 1: n-1
        for j = i+1: n
            A(j, i) = A(j, i)/A(i, i);
            A(j, :) = A(j, :)-A(j, i).*A(i, :);
        end
        if A(n,n) == 0
            disp('No unique solution')
        end
        x_values(n) = A(n, n+1)/A(n, n);
    end
    for i = n-1:-1:1
       x_values(i) = (A(i, n+1) - sum(A(i,i+1:n)*x_values(i+1:n)'))./A(i,i);
    end
end

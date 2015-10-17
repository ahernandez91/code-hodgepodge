function x_values = partialpivot(n, A)
    x_values = zeros(1, n);
    p = (1:n)';	        % initialize the pivoting vector
    s = max(abs(A'));     % compute the scale of each row
    for k = 1:(n-1)
        r = abs(A(p(k),k)/s(p(k)));
        kp = k;
        for i = (k+1):n
            t = abs(A(p(i),k)/s(p(i))); 
            if t > r,  r = t;  kp = i;  end
        end
        copy = p(kp);  p(kp) = p(k);  p(k) = copy;   % interchange p(kp) and p(k) 
        for i = (k+1):n
            A(p(i),k) = A(p(i),k)/A(p(k),k);
            for j = (k+1):n
                A(p(i),j) = A(p(i),j)-A(p(i),k)*A(p(k),j);
            end
        end
    end
    
    x_values(n) = A(p(n),n+1)/A(p(n), n);
    for i = n-1:-1:1
        x_values(i) = (A(p(i), n+1) - sum(A(p(i), i+1:n)*x_values(i+1:n)'))./A(p(i),i);
    end
end
    
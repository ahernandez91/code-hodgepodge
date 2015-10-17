function TDD = lagrangeint(X, Y)
    n = numel(X); 
    
    TDD = zeros(n, n);
    TDD(:, 1) = Y';
    for i = 2: n
        for j = 2 : i
            TDD(i,j) = (TDD(i, j - 1) - TDD(i - 1, j - 1)) / (X(i) - X(i-j+1));
        end
    end
end
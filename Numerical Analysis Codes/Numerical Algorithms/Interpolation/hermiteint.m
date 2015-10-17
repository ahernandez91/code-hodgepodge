function p = hermiteint(x,f,dfdx)

n = length(x);
x = x(:);
v = ones(n,1);
V(1:2*n,2*n) = [v;zeros(n,1)];

    for j = 1:2*n-1
        V(n+1:end,2*n-j) = j*v;
        v = x.*v;
        V(1:n,2*n-j) = v;
    end
    p = (V\[f(:);dfdx(:)]).';
end
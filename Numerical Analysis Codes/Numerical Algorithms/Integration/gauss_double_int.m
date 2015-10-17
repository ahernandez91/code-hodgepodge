function I = gauss_double_int(a, b, c, d, m, n)
    h1 = (b-a)/2;
    h2 = (b+a)/2;
    J = 0;
    r = legendre_roots; %matrix of roots of legendre polynomials from l_root fcn
    C = legendre_weights; %matrix of weights with associated legendre polynomials
                          %from l_weight fcn
    
    
    for i = 1: m
        x =h1*r(m, i) + h2;
        d1 = d(x);
        c1 = c(x);
        k1 = (d1 - c1)/2;
        k2 = (d1 + c1)/2;
        for j = 1:n
            y = k1*r(n, j) + k2;
            Q = f(x, y);
            JX = JX + C(n, j)*Q;
        end
        J = J + C(m, i)*k1*JX;
    end
    I = h1* J;
end

        

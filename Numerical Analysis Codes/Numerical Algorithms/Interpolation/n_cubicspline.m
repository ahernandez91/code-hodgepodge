function [a, b, c, d] = n_cubicspline(n, x, a)
    h = zeros(1, n);    
    for i = 1:n
        h(i) = x(i+1) - x(i);
    end
    alpha = zeros(1, n);
    for i =2: n
        alpha(i) = (3/h(i))*(a(i+1) - a(i)) - (3/h(i-1))*(a(i)-a(i-1));
    end
    l = ones(1, n);
    u = zeros(1, n);
    z = zeros(1, n);
    
    for i = 2:n
        l(i) = 2*(x(i+1)-x(i-1)) - h(i-1)*u(i-1);
        u(i) = h(i)/l(i);
        z(i) = (alpha(i) -h(i-1)*z(i-1))/l(i);
    end
    c = zeros(1, n+1);
    b = zeros(1, n);
    d = zeros(1, n);
    for j = n:-1:1
        c(j) = z(j) - u(j)*c(j+1);
        b(j) = (a(j+1) - a(j))/h(j) - h(j)*(c(j+1) +2*c(j))/3;
        d(j) = (c(j+1)- c(j))/(3*h(j));
        
    end
end

    
    
        
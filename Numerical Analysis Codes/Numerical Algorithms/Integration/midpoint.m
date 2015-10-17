function I = midpoint(f, a, b, n)
    h = (b - a)/n;
    XI0 = f(a) + f(b);
    XI1 = zeros(1,n);
    
    for i = 1:n/2
       X = a + (2*i-1)*h;
       XI1(:,i) =  f(X)
    end
    
    I = (2*h)*(sum(XI1))
        
end
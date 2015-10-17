
function I = trapezoid(f, a, b, n)
    h = (b - a)/n;
    XI0 = f(a) + f(b);
    XI1 = zeros(1,n);
    
    for i = 1:n-1
       X = a + i*h;
       XI1(:,i) =  f(X)
    end
    
    I = h*(XI0 +2*sum(XI1))/2
        
end


function I = simpson(f, a, b, n)
    h = (b - a)/n;
    XI0 = f(a) + f(b);
    XI1 = zeros(1,n+1);
    XI2 = zeros(1,n+1);
    for i = 1:n-1
       X = a + i*h;
       
       if mod(i, 2) == 0 
           XI2(:,i) =  f(X)
       else
           XI1(:,i) = f(X)
       end
    end
    I = h*(XI0 +2*sum(XI2) +4*sum(XI1))/3
        
    end
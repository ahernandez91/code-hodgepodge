function w = adam_bash_5step(a, b, n, alpha)
    h = (b-a)/n;
    t = zeros(1,n+1);
    t(1) = a;
    w = zeros(1, n+1);
    f = @(t, w) (w/t) + 1;
    y = @(t) t*log(t) + 2*t;
    w(1) = alpha;
    for i = 2:5
        
        t(i) = a + (i-1)*h;
        w(i) = y(t(i));
    end

    for i = 6:n+1
        w(i) = w(i-1) + (h/720)*(1901*f(t(i-1), w(i-1)) - 2774*f(t(i-2), w(i-2)) + 2616*f(t(i-3), w(i-3)) - 1274*f(t(i-4), w(i-4)) +251*f(t(i-5),w(i-5)));
        t(i) = a + (i-1)*h;
    end
    
end
function w = adam_bash_3step(a, b, n, alpha)
    h = (b-a)/n;
    t = zeros(1,n+1);
    t(1) = a;
    w = zeros(1, n+1);
    f = @(t, w) (w/t) + 1;
    y = @(t) t*log(t) + 2*t;
    w(1) = alpha;
    for i = 2:3
        
        t(i) = a + (i-1)*h;
        w(i) = y(t(i));
    end

    for i = 4:n+1
        w(i) = w(i-1) + (h/12)*(23*f(t(i-1), w(i-1)) - 16*f(t(i-2), w(i-2)) + 5*f(t(i-3), w(i-3)));
        t(i) = a + (i-1)*h;
    end
    
end
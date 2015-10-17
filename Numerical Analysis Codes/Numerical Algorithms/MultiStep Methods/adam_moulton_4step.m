function w = adam_moulton_4step(a, b, n, alpha)
    h = (b-a)/n;
    t = zeros(1,n+1);
    t(1) = a;
    w = zeros(1, n+1);
    f = @(t, w) (w/t) + 1;
    w(1) = alpha;
    
    for i = 2:n+1
        k1 = h*f(t(i-1),w(i-1));
        k2 = h*f(t(i-1) +h/2, w(i-1) +k1/2);
        k3 = h*f(t(i-1) +h/2, w(i-1) +k2/2);
        k4 = h*f(t(i-1) + h, w(i-1) + k3);
        
        w(i) = w(i-1) +(k1 +2*k2 +2*k3 +k4)/6;
        
        t(i) = a + (i-1)*h;
   
    end

    for i = 5:n+1
        w(i) = w(i-1) + (h/720)*(251*f(t(i), w(i)) + 646*f(t(i-1), w(i-1)) - 264*f(t(i-2), w(i-2)) + 106*f(t(i-3), w(i-3)) -19*f(t(i-4), w(i-4)));
        t(i) = a + (i-1)*h;
    end
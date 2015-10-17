function I = double_int(a, b, m, n)
    h = (b-a)/n;
    j1 = 0; %end terms
    j2 = 0; %even terms
    j3 = 0; %odd terms
    

    
    for i = 0: n
        d = @(x) 1;
        c = @(x) 0;
        f = @(x, y) sqrt((x^2)/(9-x^2-y^2)+(y^2)/(9-x^2-y^2)+1);
        x = a +i*h;
        H = (d(x) - c(x))/m;
        k1 = f(x, c(x)) + f(x, d(x));
        k2 = 0;
        k3 = 0;
        for j = 1: m-1
            y = c(x) +j*H;
            Q = f(x, y);
            if mod(j, 2) == 0 
                k2= k2 + Q;
            else
                k3 = k3 + Q;
            end
            L = ((k1 + 2*k2 + 4*k3)*H)/3;
        end
        if i == 0 || i == n
            j1 = j1 + L;
        elseif mod(i, 2) == 0
            j2 =  j2 +L;
        else
            j3 =  j3 +L;
        end
        
    end
    I = h*(j1 + 2*j2 +4*j3)/3;
end

function [t, w] = euler(a, b, n, t0)
    h = (b-a)/n; %step size
    t = a; %left bound
    w = t0; %initial value
    f = @(t, w) -9*w; %some inline function
    
    %stuff:
    for i = 1:n
        w = w + h * f(t, w);
        t = a + i*h;
        
    end
    
end

        
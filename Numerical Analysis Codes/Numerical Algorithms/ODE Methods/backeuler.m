function [t, w] = backeuler(a, b, n, t0)
  h = (b-a)/n; %step size
    t = a; %left bound
    
    w = t0;
    
    for i = 1: n
        w = (w - sqrt(w^2 + 4*(1+h*50)*h*50))/(2*(1+h*50)); 
    end
end
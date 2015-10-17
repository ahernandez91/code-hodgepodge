function y = fixedpoint1(f, p0, tol)
    i = 1;
    p = p0 
    while abs(p-p0) < tol
        p = f(p0);
        if abs(p-p0) < tol
            p
            return;
        end
        i = i + 1;
        p0 = p;
    end
    
end
function p = bisection(f, a, b, tol)
    if f(a) == 0
        p = a; 
        return;
    elseif f(b) == 0
        p = b; 
        return;
    elseif f(a) * f(b) > 0
        disp('f(a) and f(b) do not have opposite signs')
    end
    p = (a+b)/2;
    while p-a  >= tol
        c = (a+b)/2;
        if f(c) == 0
            p =c;
            return;
        elseif f(c) * f(a) < 0
            b =c;
        else 
            a= c;
        end
        
        if (b -a < tol)
            if abs(f(a)) < abs(f(b)) && abs(f(a)) < tol
                p =a;
                return;
            elseif abs(f(b)) < tol
                p = b;
                return;
            end
        end
    end
end

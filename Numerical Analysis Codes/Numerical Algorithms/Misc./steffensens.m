function [p, k] = stefensens(f, p0, tol)
    for k =1:1000
        p1 = f(p0);
        p2 = f(p1);
        p = p0 -((p1 -p0)^2)/(p2 -2*p1 + p0);
        if abs(p-p0) < tol
            break
        end
        p0 = p;
    end
end

            
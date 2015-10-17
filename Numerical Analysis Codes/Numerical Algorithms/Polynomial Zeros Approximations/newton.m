%Algorithm for Newton's Method

function [p, k] = newton(f, df, p0, tol)
    for k = 1:1000
        p = p0 -(f(p0)/df(p0));
        if abs(p-p0) < tol
            break;
        end
        p0 =p;
    end
end

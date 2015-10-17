function aitkens(f, p0, n)
    for n = 1:n
        p1 = f(p0)
        p2 = f(p1)
        phat_values = p0 -((p1 -p0)^2)/(p2 -2*p1 + p0)
    end
end

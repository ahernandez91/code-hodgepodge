function J = JJ(x)
    J = eye(4); % 4x4 identity matrix
    u = sum(x);
    for i = 1: 4
        for j = 1:4
            J(i, j) = J(i, j) + (i*exp(cos(i*u))*sin(i*u));
        end
    end
end

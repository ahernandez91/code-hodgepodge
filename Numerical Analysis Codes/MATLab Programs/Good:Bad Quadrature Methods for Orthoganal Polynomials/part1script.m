function phi_values = part1script(a_vec, b_vec, x_vec)
    n = length(a_vec);
    m = length(x_vec);
    phi_values = zeros(n + 1, m);

    phi_values(1, :) = 1 / sqrt(b_vec(1));
    a0 = a_vec(1);
    b1 = b_vec(2);
    phi_values(2, :) = ((x_vec - a0) .* phi_values(1, :)) / sqrt(b1);

    
    for k =2:n
        bk = b_vec(k + 1);
        bk_minus_1 = b_vec(k);
        ak_minus_1 = a_vec(k);
        left_quantity = ((x_vec - ak_minus_1) .* phi_values(k, :));
        right_quantity = sqrt(bk_minus_1) * phi_values(k - 1, :);
        phi_values(k + 1, :) = (left_quantity - right_quantity) / sqrt(bk);
    end
end


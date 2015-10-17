function S = part2badscript(a_vec, b_vec)
    n = length(a_vec);
    a = a_vec;
    b = b_vec;    
    S = zeros(n+1,n+1);
    
    S(1,1) = sqrt(1/b(1));
    S(2,:) = (S(1,:)-[0,a(1)*S(1,1:end-1)])/sqrt(b(2));
    
    for i = 3:n+1
        S(i, :) = (S(i-1,:) - [0, a(i-1)*S(i-1, 1:end-1)]-[0,0,sqrt(b(i-1))*S(i-2, 1:end-2)])/sqrt(b(i));
    end
    

end
function [x, w, E] = part4badscript(a, b)

    n = length(a);
    S = zeros(n+1,n+1);
    S(1,1) = sqrt(1/b(1,1));
    S(2,:) = (S(1,:)-[0,a(1)*S(1,1:end-1)])/sqrt(b(2));
    
    for i = 3:n+1
        S(i, :) = (S(i-1,:) - [0, a(i-1)*S(i-1, 1:end-1)]-[0,0,sqrt(b(i-1))*S(i-2, 1:end-2)])/sqrt(b(i));
    end
    
    Phi = zeros(n, n);
    x = sort(roots(S(n+1, 1:n+1)));
    for j =1:n
        Phi(j,:)= polyval(S(j,1:j),x);
    end
    
    w = 1.0./diag(Phi'*Phi);
    
    for k=0:2*n 
        E(k+1)=abs(w'*cos(k*acos(x)) - (1+(-1)^k)/(1-k^2 + 1.0e-18));
    end

end
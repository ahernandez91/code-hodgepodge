function [x, w, E] = part3script(a, b)
format long
n = length(a);
A = zeros(n, n);

    
    %recursion relation
    for i = 1:n-1
        A(i, i) = a(i);
        A(i, i+1) = sqrt(b(i+1));
        A(i+1, i) = sqrt(b(i+1));
    end
    [Q,X] = eig(A);
    x = diag(X);
    w =b(1,1)*Q(1,:)'.^2;
    
    E =  zeros(2*n+1, 1);
    for k=0:2*n 
        E(k+1, 1)=abs(w'*cos(k*acos(x)) - (1+(-1)^k)/(1-k^2 + 1.0e-18));
    end
    
    
end
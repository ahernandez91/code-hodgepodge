function Q = hermite(xi, f, df)

n=length(xi);
Q=zeros(n+1,n+1);
   

    for i = 1:n
        z(2i)= xi;
        z(i+1) = xi;
        Q(2i, 0) = f(xi);
        Q(2i+1, 0) = f(xi);
        Q(2i+1, 1) = df(xi);
        if i ~= 0
            Q(2i, 1) = (Q(2i, 0) - Q(2i-1, 0))/(z(2i) - z(2i -1));
        end
    end
    for i = 2:2:n
        for j = 2:i
            Q(i, j) = (Q(i, j-1) - Q(i-1, j-1))/(z(i) - z(i-j));
        end
    end
end

        
        
        
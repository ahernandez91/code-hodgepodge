function Q = neville(x,xi,fi)

n=length(xi)-1;
Q=zeros(n+1,n+1);
Q(:,1)=fi(:);

    for i=1:n
        for j=1:i
            Q(i+1,j+1)=((x-xi(i-j+1))*Q(i+1,j)- ...
            (x-xi(i+1))*Q(i,j)) ...
            /(xi(i+1)-xi(i-j+1));
        end
    end
end
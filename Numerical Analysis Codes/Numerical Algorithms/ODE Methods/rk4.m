function [t,w]=rk4(f,a,b,alpha,N)

h=(b-a)/N;
t=(a:h:b)';
w=zeros(N+1,length(alpha));
w(1,:)=alpha(:)';

for i=1:N
    k1=f(t(i),w(i,:));
    k2=f(t(i)+h/2,w(i,:)+h*k1/2);
    k3=f(t(i)+h/2,w(i,:)+h*k2/2);
    k4=f(t(i)+h,w(i,:)+h*k3);
    w(i+1,:)=w(i,:)+h/6*(k1+2*k2+2*k3+k4);
end
       
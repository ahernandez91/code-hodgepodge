function [p,flag] = newton(f,J,p0,tol)
flag = 0;
    for i=1:50
        p = p0 - J(p0)\f(p0);
        tmp(i,:) = [i,norm(p),norm(p-p0),norm(f(p)),norm(J(p))];
        if norm(p-p0)<tol
            flag=1; 
            break; 
        end
        p0=p;
    end
  if flag==0
    tmp;
  end
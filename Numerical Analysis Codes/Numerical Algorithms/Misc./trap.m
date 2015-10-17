function  [t, w] = trap(f,fy, a, b, N, alpha, TOL, M)
h = (b-a)/N;
t = a; 
w = alpha;

for i = 1:N
    k1 = w + h/2*f(t, w);
    w0 = k1;
    j =1;
    flag = 0;
    while flag == 0
        w = w0 - (w0 - h/2*f(t+h, w0) - k1)/(1- h/2*fy(t + h, w0));
        if abs(w - w0) < TOL 
            flag = 1;
        else
            j = j + 1;
            w0 = w;
            if j > M
                disp('She cant take much more!')
            end
            
        end
        
    end
    t = a + i*h;
end
end

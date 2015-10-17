N = 50;
L = 10;
x = 0: L/N: L;
f = 0;

%initialize vectors for boundary conditions
T = zeros(N + 1, N + 1);
T1 = zeros(N + 1, N +1);
T2 = zeros(N + 1, N +1);
T3 = zeros(N + 1, N +1);
T4 = zeros(N + 1, N +1);

%creation of boundary conditions
for i = 1: N + 1    
    for j = 1: N + 1
        T1(i, j) = (i -1);
        T2(i, j) = (N + 1 - i);
        T3(i, j) = (j -1);
        T4(i, j) = (N + 1 -j);
        T(i, j) = min([T1(i,j), T2(i, j), T3(i, j), T4(i, j)]);
    end
end


%time step stuff
eta = 0.24;
dx = L/N;
k = 1;
dt = eta/(25*k);

for k = 1: 300
    T_new = T;
    
    for i = 2: N 
        for j = 2: N
            T_new(i, j) = (.24)*(T(i -1, j) + T(i +1, j) + T(i, j -1) + T(i, j + 1) -4*T(i, j)) + T(i, j);
        end
    end
    T = T_new;
    if mod(k + 9, 10) == 0
        xx = 0:L/N:L;
        yy = 0:L/N:L;
        [X, Y] = meshgrid(yy, xx);
        f = f + 1;
        surf(X, Y, T)
        axis([0 L 0 L 0 50])
        saveas(gcf, ['heat_', sprintf('%03d', f), '.png'])
        pause(0.01)
    end
end
    
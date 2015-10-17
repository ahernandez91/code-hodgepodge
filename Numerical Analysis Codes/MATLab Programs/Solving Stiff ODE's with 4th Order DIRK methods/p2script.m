f = @(y) [-.04*y(1) + y(2)*y(3); 400*y(1) - 1e4*y(2)*y(3) - 3000*y(2)^2; .3*y(2)^2];
J = @(y) [-0.04, y(3), y(2); 400, -1e4*y(3) - 6000*y(2), -1e4*y(2); 0, 0.6*y(2), 0];

[t2, y2] = rkf(f, 0, 3, [1;0;0;], 0.1, 1e-7, 0.25, 1.0e-3);
plot(t2, y2, '.-')
title('RKF Plot')
xlabel('t-axis')
ylabel('y-axis')


figure;
[t3, y3] = sdirk(f, J, 0, 3, [1;0;0], 0.1, 1e-7, 0.25, 1.0e-3);
plot(t3, y3, '.-')
title('SDIRK Plot')
xlabel('t-axis')
ylabel('y-axis')


%This will generate a random set of integers that will be stored and used
%to create a cubic function.
format short

F = randi([-20 20], 1, 4)

%We find the deriviative of the polynomial and set the derivative equal to
%0 and look for its roots
deriv_F = polyder(F);
roots_deriv_F = roots(deriv_F)';


%In the case where c = 0 and d = 0 in our polynomial, and we have no roots
%in the derivative of our polynomial
size_roots_deriv_F = numel(roots_deriv_F);
if size_roots_deriv_F == 0
    F_endpt_a = polyval(F, -1);
    F_endpt_b = polyval(F, 2);
    if F_endpt_a > F_endpt_b 
        x_max = F_endpt_a
        disp('Max occurs at: -1')
        x_min = F_endpt_b
        disp('Min occurs at: 2')
    else
        x_max = F_endpt_b
        disp('Max occurs at: 2')
        x_min = F_endpt_a
        disp('Max occurs at: -1')
    end
x = [-1:0.0001:2];
set(gca, 'ylim', [x_min, x_max])
y = polyval(F, x);
plot(x, y)
grid on
    break;
end

%We save the two roots as r1 and r2 and checks if the roots are repeated
r1= roots_deriv_F(1);
if size_roots_deriv_F == 1
    roots_deriv_F(end+1) = r1;
    r1= r2;
    r2= roots_deriv_F(2);
else
    r2 = roots_deriv_F(2);
end



%Computes the value of the endpoints of the polynomial
F_endpt_a = polyval(F, -1);
F_endpt_b = polyval(F, 2);

result_store = [F_endpt_a, F_endpt_b];

%Tests if zeros of the derivative of function are contained in the interval
%[-1, 2]. And also tests if the roots are complex
if r1 <= 2 && r1 >= -1 && isreal(r1) == 1
    result_store(end+1) = polyval(F, r1);
else
    disp('r1 not in [-1, 2]')
end

if r2 <=2 && r2 >=-1 && isreal(r2) == 1
    result_store(end+1) = polyval(F, r2);
else
    disp('r2 not in [-1, 2]')
end


        

%Returns max value and min value stored in the variable result_store
x_max = max(result_store)
x_min = min(result_store)

%The following code determines where the x_min and x_max occur at and
%returns the x-value of the extrema.
F_r1 = polyval(F, r1);
F_r2 = polyval(F, r2);
if F_r1 == x_max
    disp('Max occurs at:')
    disp(r1)
elseif F_r2 == x_max
    disp('Max occurs at:')
    disp(r2)
else
    if F_endpt_a == x_max
        disp('Max occurs at:')
        disp(-1)
    elseif F_endpt_b == x_max
        disp('Max ooccurs at:')
        disp(2)
    end
end

if F_r1 == x_min
    disp('Min occurs at:')
    disp(r1)
elseif F_r2 == x_min
    disp('Min occurs at:')
    disp(r2)
else
    if F_endpt_a == x_min
        disp('Min occurs at:')
        disp(-1)
    elseif F_endpt_b == x_min
        disp('Min ooccurs at:')
        disp(2)
    end
end




%plots the graph of the function F over the interval [-1, 2]
x = [-1:0.0001:2];
set(gca, 'ylim', [x_min, x_max])
y = polyval(F, x);
plot(x, y)
grid on


    
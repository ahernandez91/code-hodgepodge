function Rnum = RombergInt(f,a,b,m)
% Integration algorithm based on Romberg extrapolation
% f - string input for function y = f(x) (e.g. f = 'x.^6')
% a - lower limit of integration
% b - upper limit of integration
% m - maximal number of Romberg iterations
% Rnum - row-vector of numerical approximations for the integral of f(x) between x = a and x = b:
% the entry with index k in Rnum corresponds to the approximation of order O(h^(2k))

R = ones(m,m); % the matrix for Romberg approximations 
              
hmin = (b-a)/2^(m-1); % the minimal step size 

for k = 1 : m
    
    h = 2^(k-1)*hmin; % the step size for the k-th row of the Romberg matrix
    
	x = a : h : b;
	f1 = eval(f);
	k1 = length(f1);
    R(k,1) = 0.5*h*(f1(1) + 2*sum(f1(2:k1-1)) + f1(k1)); % trapezoidal rule for the first column of the Romberg matrix
end
                   
for k = 2 : m % compute the k-th column of the Romberg matrix
    
    for kk = 1 : (m-k+1) % the matrix of Romberg approximations is triangular!
                        
        R(kk,k) = R(kk,k-1)+(R(kk,k-1) - R(kk+1,k-1))/(4^(k-1)-1); % see the Romberg integration algorithm
    end 
        
end

% define the vector Rnum for numerical approximations
Rnum = R(1,:); 

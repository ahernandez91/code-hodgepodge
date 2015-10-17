function yout = barycentric_int(xout, xin, fin)
 %xout: fine mesh grid of values where f(x) and P(x) will be evaluated
 %xin: interpolation points
 %fin: the function f(x) evaluated at the interpolation points
    
    %vector where barycentric weights will be stored
    lambda_store = zeros(1, length(xin)-1);
    
    %This nested for-loop calculates the barycentric weights and stores
    %them in lambda_store
    for j = 1: length(xin)
        lambda = 1;
        for k = 1: length(xin)
            if j ~= k
               lambda  = lambda * ((xin(j) - xin(k)));
            end
        end  
        lambda_store(j) = 1/lambda;
    end
    
    %vector that will contain the polynomial P(x) which interpolates the
    %function f(x)
    yout = zeros(1, length(xout));
    
    %This nested for loop simultaneously calculates the summation of the
    %numerator and the summation of the denominator and stores each divided
    %value into yout.
    for i = 1:length(xout)
        sum_numerator =0;
        sum_denominator = 0;
        
        for j=1:length(xin)
            if xout(i) == xin(j) 
               yout(i) = fin(j);
                
            else
                sum_numerator = sum_numerator + ((lambda_store(j)*fin(j))/(xout(i) - xin(j)));
                sum_denominator = sum_denominator + ((lambda_store(j)/(xout(i) - xin(j))));
            end
        end
        yout(i) = sum_numerator/sum_denominator ; %final interpolating polynomial
    end  
end

   
    
    
    
    
    
    
    
   
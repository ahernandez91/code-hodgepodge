function yout = lagrange_int(xout, xin, fin)
 %xout: fine mesh grib of values where f(x) and P(x) will be evaluated
 %xin: interpolation points
 %fin: the function f(x) evaluated at the interpolation points
   
   %matrix containing lagrange values
   l_matrix = ones(length(xin),length(xout));
   
   %For-loop calculates the lagrange basis values and stores them in a
   %matrix by rows. 
   for i = 1:length(xin)
      for j = 1:length(xin)
         if (i ~= j)
            l_matrix(i,:) = l_matrix(i,:) .* (xout - xin(j))/(xin(i) - xin(j));
         else
             continue
         end
      end
   end
   
   
   %For-loop which multiplies values of the lagrange matrix by ith value in
   %the vector fin to output the value yout which represents the
   %interpolating polynomial
   yout=0;
   for i = 1:length(xin)
      yout = yout + fin(i)*l_matrix(i,:);
   end
  
   
end

    
    
    
    
    
    


    
    

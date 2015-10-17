function [n, nth_term] = NestedRadical(40)
 %This will be used to generate a plot
    nth_term_vector = zeros(1, n);
    %Loop iterates the sequence starting at 2 we use a_1 = initial_term = 1
    %to start.
    for n = 2:n
        initial_term = 1;
        %Second for loop decrements value of n by 1 all the way too 2, that is,
        %(n-1),(n-2)... 2
        for k = n:-1:2
            initial_term = sqrt(k * initial_term + 1);
            nth_term = initial_term;
            %Stores iterated terms in nth_term_vector 
            nth_term_vector(n) = nth_term;
            
        end
    end
    %Plots ln(|a_n -a|) vs n and the line y = 3-ln(2)*n
    plot(1:n, log(abs(nth_term_vector-3)));
    hold on
    x=[1:0.001:n];
    y = 3 -log(2)*x;
    plot(x, y)
    grid on
end

%After running this code, we can guess that limiting value of the sequence
%as n tends to infinity is 3. 

%We also conclude that the sequence B_n appropriate for a_n - a = O(B_n) is
%B_n = n.



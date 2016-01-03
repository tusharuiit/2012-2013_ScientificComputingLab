function y = Evaluate_Analytical_Solution_Exercise2( x )

%Evaluate_Analytical_Solution_Exercise2 - Evaluate the value of the function based on
%analytical Solution for given value(s) of x

%Function corresponding the Exercise 2

n = length(x);
        for i = 1:n
             y(i) = 200 / (20 - 10 * exp(-7*x(i)));
        end
end


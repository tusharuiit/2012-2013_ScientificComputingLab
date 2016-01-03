% Function for calculating Value of f(X)
% Input - Array [X], Output - Array [Y] = f(X) 
function Y = EvalFunc(X)
n = length(X);
for i = 1:n
     Y(i) = 10 / (1 + 9 * exp(-X(i)));
end
end
% End of Function EvalFunc    

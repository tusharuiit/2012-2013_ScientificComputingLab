function err = ExactError( y_computed, y_exact, dt, flag_infinite_error )
%Computes the approximation error for a given set of computed and exact
%values based on analytical solution

if(nargin < 4)
    flag_infinite_error = 0;
end

if(flag_infinite_error == 1)
    err = Inf;
else

    n = length(y_computed);
    err = 0;
    for i = 1:n;
        err = err + (y_computed(i) - y_exact(i))^2;
    end
    err = err * dt / 5;
    err = sqrt(err);
end
end


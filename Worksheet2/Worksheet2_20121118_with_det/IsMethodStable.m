function stability_criterion = IsMethodStable( y_computed_values, error_flag )
%Checks whether the Method used is stable for the specified timestep
%   Checking if the values of 'y_computed_values' are converging /
%   diverging with time. If converging, return X(Method is stable) 
%   else return - (method is unstable)

if(nargin <2)
    error_flag = 0;
end
if(error_flag == 1)
    stability_criterion = '-';
else
    % We consider only second half of the values of array to check for
    % convergence as first half might have some unnatural jumps in values,
    % which might not eventually affect the convergence / divergence.
    
    n = length(y_computed_values);
    if(rem(n, 2) == 0)
        start = n/2;
    else
        start = (n-1)/2;
    end
    
    count_diff = 1;
    for i = start:n
        y_differences_array(count_diff) = abs(y_computed_values(i) - y_computed_values(i-1));
        count_diff = count_diff + 1;
    end
    count_error_reduced = 0;
    count_total = 0;
    n = length(y_differences_array);
    for i = 2:n
        count_total = count_total + 1;
        if((y_differences_array(i) - y_differences_array(i-1)) <= 0)
            count_error_reduced = count_error_reduced + 1;
        end
    end
    y_last_difference = y_differences_array(n-1) - y_differences_array(n);
    if( count_total > count_error_reduced || (abs(y_last_difference))>0.1)
        stability_criterion = '-';
    else
       stability_criterion = 'X';
    end
end
end


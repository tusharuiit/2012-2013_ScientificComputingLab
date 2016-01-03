function reduction_error = ReductionError( error_matrix )
%UNTITLED8 Summary of this function goes here
reduction_error = NaN;
n = length(error_matrix);
for i = 2:n;
    if(error_matrix(i-1) == Inf || error_matrix(i) == Inf)
        reduction_error = [reduction_error, Inf];
    else
        reduction_error = [reduction_error, (error_matrix(i-1) / error_matrix(i))];
    end
end

end


function redErr = ReductionError( ErrMatrix )
%UNTITLED8 Summary of this function goes here
redErr = [];
n = length(ErrMatrix);
for i = 2:n;
    redErr = [redErr, (ErrMatrix(i-1) / ErrMatrix(i))];
end

end


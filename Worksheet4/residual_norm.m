function r = residual_norm(matrix)
    r = 0;
    no = 0;
    [X, Y] = size(matrix);
    for i = 2:fix(X/2)
        for j = 2:fix(Y/2)
            r = r + (matrix(i,j) -  matrix(X+1-i,Y+1-j))^2;
            no = no + 1;
        end
    end
    r = sqrt(r / no);
end
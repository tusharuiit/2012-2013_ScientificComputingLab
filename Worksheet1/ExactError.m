function err = ExactError( Ycomp, Yexact, dt )
%Computes the approximation error for a given set of computed and exact
%values
n = length(Ycomp);
err = 0;
for i = 1:n;
    err = err + (Ycomp(i) - Yexact(i))^2;
end
err = err * dt / 5;
err = sqrt(err);

end


function err = ApproxError( Ycomp, YBest, dt )
%Computes the approximation error for a given set of computed and exact
%values;

%Getting required values of Ybest based on size of Ycomp
n1 = length(Ycomp);
n2 = length(YBest);
fac = (n2 - 1)/(n1 - 1);
YBestRed = [];
for i = 1:fac:n2
    YBestRed = [YBestRed, YBest(i)];
end

err = 0;
for i = 1:n1;
    err = err + (Ycomp(i) - YBestRed(i))^2;
end
err = err * dt / 5;
err = sqrt(err);

end


function Y = ExpEuler( y0, tstart, dt, tend, Eval_Func )
%ExpEuler - Evaluates value of function numerically based on Explicit Euler
%method
n = (tend - tstart) / dt + 1;
Y(1) = y0;

for i = 2:n
    Y(i) = Y(i-1) + dt*(Eval_Func(Y(i-1)));
end

end


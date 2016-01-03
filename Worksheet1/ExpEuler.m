function Y = ExpEuler( y0, dt, tend )
%ExpEuler - Evaluates value of function numerically based on Explicit Euler
%method

n = tend / dt;
for i = 1:n
    if(i == 1)
        Y(1) = y0 + dt*(EvalFuncDer(y0));
    else
        Y(i) = Y(i-1) + dt*(EvalFuncDer(Y(i-1)));
    end
end

Y = [y0, Y];
end


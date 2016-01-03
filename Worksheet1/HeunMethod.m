function Y = HeunMethod( y0, dt, tend )
%HeunMethod - Evaluates value of function numerically based on Method
%of Heun

n = tend / dt;
for i = 1:n
    if(i == 1)
        Y(1) = y0 + dt*(EvalFuncDer(y0));
        Y(1) = y0 + 0.5*dt*(EvalFuncDer(y0) + EvalFuncDer(Y(1)));
    else
        Y(i) = Y(i-1) + dt*(EvalFuncDer(Y(i-1)));
        Y(i) = Y(i-1) + 0.5*dt*(EvalFuncDer(Y(i-1)) + EvalFuncDer(Y(i)));
    end
end
Y = [y0, Y];
end
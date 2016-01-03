function Y = HeunMethod( y0, tstart, dt, tend, Eval_Func )
%HeunMethod - Evaluates value of function numerically based on Method
%of Heun
n = (tend - tstart) / dt + 1;
Y(1) = y0;

for i = 2:n
   Y(i) = Y(i-1) + dt*(Eval_Func(Y(i-1)));
   Y(i) = Y(i-1) + 0.5*dt*(Eval_Func(Y(i-1)) + Eval_Func(Y(i)));
end

end
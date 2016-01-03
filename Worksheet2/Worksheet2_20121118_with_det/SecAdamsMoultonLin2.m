function Y = SecAdamsMoultonLin2( y0, tstart, dt, tend )
%Second Order Adams Moulton Method Linearization 2 - Evaluates value of function
%numerically based on Second Order Adams Moulton Method Linearization 2
global exno;
n = (tend - tstart) / dt + 1;
Y(1) = y0;

for i = 2:n
    Y(i) = (Y(i-1) + dt*0.5*Y(i-1)*(7 - (0.7*Y(i-1)))) / (1 + (0.5*dt*((0.7*Y(i-1)) - 7)));
end

end
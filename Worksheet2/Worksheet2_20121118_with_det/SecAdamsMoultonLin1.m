function y_sec_adams_moulton_lin1 = SecAdamsMoultonLin1( ystart, tstart, dt, tend )
%Second Order Adams Moulton Method Linearization 1 - Evaluates value of function
%numerically based on Second Order Adams Moulton Method Linearization 1
n = (tend - tstart) / dt + 1;
y_sec_adams_moulton_lin1(1) = ystart;

for i = 2:n
    y_sec_adams_moulton_lin1(i) = (y_sec_adams_moulton_lin1(i-1) + dt*0.5*y_sec_adams_moulton_lin1(i-1)*(14 - (0.7*y_sec_adams_moulton_lin1(i-1)))) / (1 + (0.5*dt*0.7*y_sec_adams_moulton_lin1(i-1)));
end

end
function [error_flag_sec_adams_moulton, y_sec_adams_moulton] = SecAdamsMoulton( ystart, tstart, dt, tend, Eval_Func, Eval_Func_Der )

%Second Order Adams Moulton Method - Evaluates value of function
%numerically based on Second Order Adams Moulton Method

% Input Values - ystart - Initial value of function at t = tstart
% dt = time step; tend - end time at which function to be approximated
% Eval_Func = Evalute the value of function y' = f(y)
% Eval_Func_Der = Evaluate the value of Deriviative of RHS of y' = f(y) w.r.t. y

% Output Values
% y_sec_adams_moulton = estimate of values of y at all timesteps

n = (tend - tstart) / dt + 1;
y_sec_adams_moulton(1) = ystart;
error_flag_sec_adams_moulton = 0; %Initialise value of error flag

%for loop to compute the value of 'y_sec_adams_moulton' at every timestep
for i = 2:n
   y_initial_guess = y_sec_adams_moulton(i-1);
    Newton_Function = @(y_newton)(y_newton - (y_sec_adams_moulton(i-1))-(0.5*dt*(Eval_Func(y_sec_adams_moulton(i-1)) + Eval_Func(y_newton))));
    Newton_Function_Der = @(y_newton)(1 - (0.5*dt*(Eval_Func_Der(y_newton))));
    [error_flag_sec_adams_moulton, y_newton_estimate] = Newtons_Method(y_initial_guess, Newton_Function, Newton_Function_Der);
    if(error_flag_sec_adams_moulton == 1)
        fprintf('Secondary Adams Moulton Method for timestep dt = %f has not Converged in Newton Iteration. \n Thus the timestep has been dropped in further analysis\n', dt); 
        y_sec_adams_moulton = [];
         return;
    end
    y_sec_adams_moulton(i) = y_newton_estimate;
end   
end


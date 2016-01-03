function [error_flag_imp_euler, y_imp_euler] = ImpEuler( ystart, tstart, dt, tend, Eval_Func, Eval_Func_Der )
%ImpEuler - Evaluates value of function numerically based on Implicit Euler
%method

% Input Values - ystart - Initial value of function at t = tstart
% dt = time step; tend - end time at which function to be approximated
% Eval_Func = Evalute the value of function y' = f(y)
% Eval_Func_Der = Evaluate the value of Deriviative of RHS of y' = f(y) w.r.t. y

% Output Values
% y_imp_euler = estimate of values of y at all timesteps

n = (tend - tstart) / dt + 1;
y_imp_euler(1) = ystart;
error_flag_imp_euler = 0; % Initialize error_flag to 0;

%for loop to compute the value of 'y_imp_euler' at every timestep by
%approximating the value of implicit parameter using Newtons Method.

for i = 2:n
    % In this case, the equation yn+1 = yn + dt/2(f(yn) + f(yn+1)) is a quadratic equation. So, by taking the determinant of the equation, we
    % can get information whether a real solution exists or not.
    a = 0.7*dt;
    c = -y_imp_euler(i-1);
    b = 1 - (7*dt);
    det = b^2 - (4*a*c);
    if(det>0)
        %Real Roots exist. Now run the Netwons Iteration to get an approximate solution of the root. We start with initial guess of
        %the value of previous iteration as that is a fairly close to the point of interest.
        y_initial_guess = y_imp_euler(i-1);
        Newton_Function = @(y_newton)(y_newton - (y_imp_euler(i-1))-(dt*Eval_Func(y_newton)));
        Newton_Function_Der = @(y_newton)(1 - (dt*(Eval_Func_Der(y_newton))));
        [error_flag_imp_euler, y_newton_estimate] = Newtons_Method(y_initial_guess, Newton_Function, Newton_Function_Der);
        if(error_flag_imp_euler == 1)
             fprintf('Implicit Euler Method for timestep dt = %f has not Converged in Newton Iteration. \n Thus the timestep has been dropped in further analysis \n \n', dt);
             y_imp_euler = [];
             return;
        end
    y_imp_euler(i) = y_newton_estimate;
    else
        fprintf('No Real Solution exists for Implicit Euler Method for timestep dt = %f. \n Thus the timestep has been dropped in further analysis \n \n', dt);
        y_imp_euler = [];
        error_flag_imp_euler = 1;
    end
end
end
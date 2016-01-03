function [error_flag_sec_adams_moulton, y_sec_adams_moulton] = SecAdamsMoulton( ystart, tstart, dt, tend, Eval_Func, Eval_Func_Der )
%Second Order Adams Moulton Method - Evaluates value of function numerically based on Second Order Adams Moulton Method
% Input Values - ystart - Initial value of function at t = tstart  dt = time step; tend - end time at which function to be approximated
%       Eval_Func = Evalute the value of function y' = f(y) ; Eval_Func_Der = Evaluate the value of Deriviative of RHS of y' = f(y) w.r.t. y
% Output Values error_flag_sec_adams_moulton = flag for convergence of newton ;  y_sec_adams_moulton = estimate of values of y at all timesteps

n = (tend - tstart) / dt + 1;
y_sec_adams_moulton(1) = ystart;
error_flag_sec_adams_moulton = 0; %Initialise value of error flag

%for loop to compute the value of 'y_sec_adams_moulton' at every timestep
for i = 2:n
    % In this case, the equation yn+1 = yn + dt/2(f(yn) + f(yn+1)) is a quadratic equation. So, by taking the determinant of the equation, we
    % can get information whether a real solution exists or not.
    a = 0.35*dt;
    c = -(y_sec_adams_moulton(i-1)) - (dt*0.5*Eval_Func(y_sec_adams_moulton(i-1)));
    b = 1 - (3.5*dt);
    det = b^2 - (4*a*c);
    
    if(det>0)
        %Real Roots exist. Now run the Netwons Iteration to get an approximate solution of the root. We start with initial guess of
        %the value of previous iteration as that is a fairly close to the point of interest.
        y_initial_guess = y_sec_adams_moulton(i-1);
        Newton_Function = @(y_newton)(y_newton - (y_sec_adams_moulton(i-1))-(0.5*dt*(Eval_Func(y_sec_adams_moulton(i-1)) + Eval_Func(y_newton))));
        Newton_Function_Der = @(y_newton)(1 - (0.5*dt*(Eval_Func_Der(y_newton))));
        [error_flag_sec_adams_moulton, y_newton_estimate] = Newtons_Method(y_initial_guess, Newton_Function, Newton_Function_Der);
        if(error_flag_sec_adams_moulton == 1)
            fprintf('Secondary Adams Moulton Method for timestep dt = %f has not Converged in Newton Iteration. \nThus the timestep has been dropped in further analysis\n \n', dt); 
            y_sec_adams_moulton = [];
            return;
        end
        y_sec_adams_moulton(i) = y_newton_estimate;
    else
        fprintf('No Real Solution exists for Secondary Adams Moulton for timestep dt = %f. \nThus the timestep has been dropped in further analysis\n \n', dt);
        y_sec_adams_moulton = [];
        error_flag_sec_adams_moulton = 1; 
        return;
    end
end
end


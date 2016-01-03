% Worksheet 2 - Scientific Computing Lab
% Group 1 - Ravikishore Kommajosyula, Markus Auer, Tushar Upadhyay

% Exercise (a)
x_plot = [-5:1/32:5];   %domain variable for plotting the function
y_plot = Evaluate_Analytical_Solution_Exercise2(x_plot);
figure(1);
plot(x_plot, y_plot, 'b-');
title('Exercise (a) - Plotting the graph of function');
xlabel('t');
ylabel('p(t)');

% Exercise (b)
%Initialization of variables for various dt
tstart = 0;
tend = 5;
ystart = Evaluate_Analytical_Solution_Exercise2(tstart);
x_init_1_1 = [tstart:1:tend];
x_init_1_2 = [tstart:1/2:tend]; 
x_init_1_4 = [tstart:1/4:tend]; 
x_init_1_8 = [tstart:1/8:tend];
x_init_1_16 = [tstart:1/16:tend];
x_init_1_32 = [tstart:1/32:tend];
y_exact_1_8 = Evaluate_Analytical_Solution_Exercise2(x_init_1_8); 
y_exact_1_32 = Evaluate_Analytical_Solution_Exercise2(x_init_1_32);

%Creating function handles for Evaluating the value of the Function(Func_Handle) and the 
% value of the derivative of the RHS of the Function (Func_Der_Handle)

Analytical_Func_Handle = @Evaluate_Analytical_Solution_Exercise2;
Func_Handle = @Evaluate_Function_Exercise2;
Func_Der_Handle = @Evaluate_Function_Derivate_Exercise2;

% Explicit Euler Method

y_explicit_euler_1_1 = ExpEuler(ystart, tstart, 1, tend, Func_Handle);
y_explicit_euler_1_2 = ExpEuler(ystart, tstart, 1/2, tend, Func_Handle);
y_explicit_euler_1_4 = ExpEuler(ystart, tstart, 1/4, tend, Func_Handle);
y_explicit_euler_1_8 = ExpEuler(ystart, tstart, 1/8, tend, Func_Handle);
y_explicit_euler_1_16 = ExpEuler(ystart, tstart, 1/16, tend, Func_Handle);
y_explicit_euler_1_32 = ExpEuler(ystart, tstart, 1/32, tend, Func_Handle);

figure(2);
plot(x_init_1_1, y_explicit_euler_1_1, 'b--');
hold on;
plot(x_init_1_2, y_explicit_euler_1_2,'g--');
plot(x_init_1_4, y_explicit_euler_1_4, 'r--');
plot(x_init_1_8, y_explicit_euler_1_8, 'm--');
%plot(x_init_1_16, y_explicit_euler_1_16, 'y--');
%plot(x_init_1_32, y_explicit_euler_1_32, 'c--');
plot(x_init_1_32, y_exact_1_32, 'k');
hold off;
legend('blue - dt = 1', 'green - dt = 1/2', 'red - dt = 1/4', 'magenta - dt = 1/8', 'black - exact', 'Location', 'SouthEast');
axis([0 5 0 20]);
title('Exercise (b) - Explicit Euler Method');
xlabel('t');
ylabel('p(t)');

% Method of Heun
y_heun_method_1_1 = HeunMethod(ystart, tstart, 1, tend, Func_Handle);
y_heun_method_1_2 = HeunMethod(ystart, tstart, 1/2, tend, Func_Handle);
y_heun_method_1_4 = HeunMethod(ystart, tstart, 1/4, tend, Func_Handle);
y_heun_method_1_8 = HeunMethod(ystart, tstart, 1/8, tend, Func_Handle);
y_heun_method_1_16 = HeunMethod(ystart, tstart, 1/16, tend, Func_Handle);
y_heun_method_1_32 = HeunMethod(ystart, tstart, 1/32, tend, Func_Handle);

figure(3);
plot(x_init_1_1, y_heun_method_1_1, 'b--');
hold on;
plot(x_init_1_2, y_heun_method_1_2,'g--');
plot(x_init_1_4, y_heun_method_1_4, 'r--');
plot(x_init_1_8, y_heun_method_1_8, 'm--');
%plot(x_init_1_16, y_heun_method_1_16, 'y--');
%plot(x_init_1_32, y_heun_method_1_32, 'c--');
plot(x_init_1_32, y_exact_1_32, 'k');
hold off;
legend('blue - dt = 1', 'green - dt = 1/2', 'red - dt = 1/4', 'magenta - dt = 1/8', 'black - exact', 'Location', 'SouthEast');
axis([0 5 0 20]);
title('Exercise (b) - Method of Heun');
xlabel('t');
ylabel('p(t)');

% Exercise (c) & (d)

% Implicit Euler Method
% [error_flag_implicit_euler_1_1, y_implicit_euler_1_1] = ImpEuler(ystart, tstart, 1, tend, Func_Handle, Func_Der_Handle);
[error_flag_implicit_euler_1_2, y_implicit_euler_1_2] = ImpEuler(ystart, tstart, 1/2, tend, Func_Handle, Func_Der_Handle);
[error_flag_implicit_euler_1_4, y_implicit_euler_1_4] = ImpEuler(ystart, tstart, 1/4, tend, Func_Handle, Func_Der_Handle);
[error_flag_implicit_euler_1_8, y_implicit_euler_1_8] = ImpEuler(ystart, tstart, 1/8, tend, Func_Handle, Func_Der_Handle);
[error_flag_implicit_euler_1_16, y_implicit_euler_1_16] = ImpEuler(ystart, tstart, 1/16, tend, Func_Handle, Func_Der_Handle);
[error_flag_implicit_euler_1_32, y_implicit_euler_1_32] = ImpEuler(ystart, tstart, 1/32, tend, Func_Handle, Func_Der_Handle);

% Plotting estimates for which error_flag_implicit_euler == 0 (only equations that
% could be solved by Newtons method)
figure(4);
plot_handle = [];
legend_text  = [];
plot_count = 1;
plot_handle(plot_count) = plot(x_init_1_32, y_exact_1_32, 'k');
legend_text{plot_count} = ['black - exact']; plot_count = plot_count + 1; 
hold on;
%if(error_flag_implicit_euler_1_1 == 0) plot_handle(plot_count) = plot(x_init_1_1, y_implicit_euler_1_1, 'b--'); legend_text{plot_count} = ['blue - dt = 1']; plot_count = plot_count + 1; end
if(error_flag_implicit_euler_1_2 == 0) plot_handle(plot_count) = plot(x_init_1_2, y_implicit_euler_1_2, 'g--'); legend_text{plot_count} = ['green - dt = 1/2']; plot_count = plot_count + 1; end
if(error_flag_implicit_euler_1_4 == 0) plot_handle(plot_count) = plot(x_init_1_4, y_implicit_euler_1_4, 'r--'); legend_text{plot_count} = ['red - dt = 1/4']; plot_count = plot_count + 1; end
if(error_flag_implicit_euler_1_8 == 0) plot_handle(plot_count) = plot(x_init_1_8, y_implicit_euler_1_8, 'm--'); legend_text{plot_count} = ['magenta - dt = 1/8']; plot_count = plot_count + 1; end
if(error_flag_implicit_euler_1_16 == 0) plot_handle(plot_count) = plot(x_init_1_16, y_implicit_euler_1_16, 'y--'); legend_text{plot_count} = ['yellow - dt = 1/16']; plot_count = plot_count + 1; end
if(error_flag_implicit_euler_1_32 == 0) plot_handle(plot_count) = plot(x_init_1_32, y_implicit_euler_1_32, 'c--'); legend_text{plot_count} = ['cyan - dt = 1/32']; plot_count = plot_count + 1; end
legend(plot_handle, legend_text);
hold off;
axis([0 5 0 20]);
title('Exercise (b) - Implicit Euler Method');
xlabel('t');
ylabel('p(t)');

%Second Order Adams Moulton Method
%[error_flag_adams_moulton_1_1, y_adams_moulton_1_1] = SecAdamsMoulton(ystart, tstart, 1, tend, Func_Handle, Func_Der_Handle);
[error_flag_adams_moulton_1_2, y_adams_moulton_1_2] = SecAdamsMoulton(ystart, tstart, 1/2, tend, Func_Handle, Func_Der_Handle);
[error_flag_adams_moulton_1_4, y_adams_moulton_1_4] = SecAdamsMoulton(ystart, tstart, 1/4, tend, Func_Handle, Func_Der_Handle);
[error_flag_adams_moulton_1_8, y_adams_moulton_1_8] = SecAdamsMoulton(ystart, tstart, 1/8, tend, Func_Handle, Func_Der_Handle);
[error_flag_adams_moulton_1_16, y_adams_moulton_1_16] = SecAdamsMoulton(ystart, tstart, 1/16, tend, Func_Handle, Func_Der_Handle);
[error_flag_adams_moulton_1_32, y_adams_moulton_1_32] = SecAdamsMoulton(ystart, tstart, 1/32, tend, Func_Handle, Func_Der_Handle);

% Plotting estimates for which error_flag_adams_moulton == 0 (only equations that
% could be solved by Newtons method)
figure(5);
plot_handle = [];
legend_text  = [];
plot_count = 1;
plot_handle(plot_count) = plot(x_init_1_32, y_exact_1_32, 'k');
legend_text{plot_count} = ['black - exact']; plot_count = plot_count + 1;
hold on;
%if(error_flag_adams_moulton_1_1 == 0) plot_handle(plot_count) = plot(x_init_1_1, y_adams_moulton_1_1, 'b--'); legend_text{plot_count} = ['blue - dt = 1']; plot_count = plot_count + 1; end
if(error_flag_adams_moulton_1_2 == 0) plot_handle(plot_count) = plot(x_init_1_2, y_adams_moulton_1_2, 'g--'); legend_text{plot_count} = ['green - dt = 1/2']; plot_count = plot_count + 1; end
if(error_flag_adams_moulton_1_4 == 0) plot_handle(plot_count) = plot(x_init_1_4, y_adams_moulton_1_4, 'r--'); legend_text{plot_count} = ['red - dt = 1/4']; plot_count = plot_count + 1; end
if(error_flag_adams_moulton_1_8 == 0) plot_handle(plot_count) = plot(x_init_1_8, y_adams_moulton_1_8, 'm--'); legend_text{plot_count} = ['magenta - dt = 1/8']; plot_count = plot_count + 1; end
if(error_flag_adams_moulton_1_16 == 0) plot_handle(plot_count) = plot(x_init_1_16, y_adams_moulton_1_16, 'y--'); legend_text{plot_count} = ['yellow - dt = 1/16']; plot_count = plot_count + 1; end
if(error_flag_adams_moulton_1_32 == 0) plot_handle(plot_count) = plot(x_init_1_32, y_adams_moulton_1_32, 'c--'); legend_text{plot_count} = ['cyan - dt = 1/32']; plot_count = plot_count + 1; end
legend(plot_handle, legend_text);
hold off;
axis([0 5 0 20]);
title('Exercise (b) - Second Order Adams Moulton Method');
xlabel('t');
ylabel('p(t)');

%Exercise (e) & (f)

% Second Order Adams Moulton Method with Linearisation 1

%y_adams_moulton_lin1_1_1 = SecAdamsMoultonLin1(ystart, tstart, 1, tend);
y_adams_moulton_lin1_1_2 = SecAdamsMoultonLin1(ystart, tstart, 1/2, tend);
y_adams_moulton_lin1_1_4 = SecAdamsMoultonLin1(ystart, tstart, 1/4, tend);
y_adams_moulton_lin1_1_8 = SecAdamsMoultonLin1(ystart, tstart, 1/8, tend);
y_adams_moulton_lin1_1_16 = SecAdamsMoultonLin1(ystart, tstart, 1/16, tend);
y_adams_moulton_lin1_1_32 = SecAdamsMoultonLin1(ystart, tstart, 1/32, tend);

figure(6);
plot(x_init_1_2, y_adams_moulton_lin1_1_2,'g--');
hold on;
%plot(x_init_1_1, y_adams_moulton_lin1_1_1, 'b--');
plot(x_init_1_4, y_adams_moulton_lin1_1_4, 'r--');
plot(x_init_1_8, y_adams_moulton_lin1_1_8, 'm--');
plot(x_init_1_16, y_adams_moulton_lin1_1_16, 'y--');
plot(x_init_1_32, y_adams_moulton_lin1_1_32, 'c--');
plot(x_init_1_32, y_exact_1_32, 'k');
hold off;
legend('green - dt = 1/2', 'red - dt = 1/4', 'magenta - dt = 1/8','yellow - dt = 1/16', 'cyan - dt = 1/32' , 'black - exact', 'Location', 'SouthEast');
axis([0 5 0 20]);
title('Exercise (b) - Second Order Adams Moulton Method - Linearisation 1');
xlabel('t');
ylabel('p(t)');

% Second Order Adams Moulton Method with Linearisation 2

%y_adams_moulton_lin2_1_1 = SecAdamsMoultonLin2(ystart, tstart, 1, tend);
y_adams_moulton_lin2_1_2 = SecAdamsMoultonLin2(ystart, tstart, 1/2, tend);
y_adams_moulton_lin2_1_4 = SecAdamsMoultonLin2(ystart, tstart, 1/4, tend);
y_adams_moulton_lin2_1_8 = SecAdamsMoultonLin2(ystart, tstart, 1/8, tend);
y_adams_moulton_lin2_1_16 = SecAdamsMoultonLin2(ystart, tstart, 1/16, tend);
y_adams_moulton_lin2_1_32 = SecAdamsMoultonLin2(ystart, tstart, 1/32, tend);

figure(7);
plot(x_init_1_2, y_adams_moulton_lin2_1_2,'g--');
hold on;
%plot(x_init_1_1, y_adams_moulton_lin2_1_1, 'b--');
plot(x_init_1_4, y_adams_moulton_lin2_1_4, 'r--');
plot(x_init_1_8, y_adams_moulton_lin2_1_8, 'm--');
plot(x_init_1_16, y_adams_moulton_lin2_1_16, 'y--');
plot(x_init_1_32, y_adams_moulton_lin2_1_32, 'c--');
plot(x_init_1_32, y_exact_1_32, 'k');
hold off;
legend('green - dt = 1/2', 'red - dt = 1/4', 'magenta - dt = 1/8','yellow - dt = 1/16', 'cyan - dt = 1/32' , 'black - exact', 'Location', 'SouthEast');
axis([0 5 0 20]);
title('Exercise (b) - Second Order Adams Moulton Method - Linearisation 2');
xlabel('t');
ylabel('p(t)');

% Exercise (g) & (h) - Calculate approximation errors and reduction in
% errors
format long;
error_explicit_euler = [ExactError(y_explicit_euler_1_2, Evaluate_Analytical_Solution_Exercise2([tstart:1/2:tend]), 1/2), 
    ExactError(y_explicit_euler_1_4, Evaluate_Analytical_Solution_Exercise2([tstart:1/4:tend]), 1/4),
    ExactError(y_explicit_euler_1_8, Evaluate_Analytical_Solution_Exercise2([tstart:1/8:tend]), 1/8),
    ExactError(y_explicit_euler_1_16, Evaluate_Analytical_Solution_Exercise2([tstart:1/16:tend]), 1/16),
    ExactError(y_explicit_euler_1_32, Evaluate_Analytical_Solution_Exercise2([tstart:1/32:tend]), 1/32)];

error_heun_method = [ExactError(y_heun_method_1_2, Evaluate_Analytical_Solution_Exercise2([tstart:1/2:tend]), 1/2), 
    ExactError(y_heun_method_1_4, Evaluate_Analytical_Solution_Exercise2([tstart:1/4:tend]), 1/4),
    ExactError(y_heun_method_1_8, Evaluate_Analytical_Solution_Exercise2([tstart:1/8:tend]), 1/8),
    ExactError(y_heun_method_1_16, Evaluate_Analytical_Solution_Exercise2([tstart:1/16:tend]), 1/16),
    ExactError(y_heun_method_1_32, Evaluate_Analytical_Solution_Exercise2([tstart:1/32:tend]), 1/32)];

error_implicit_euler = [ExactError(y_implicit_euler_1_2, Evaluate_Analytical_Solution_Exercise2([tstart:1/2:tend]), 1/2, error_flag_implicit_euler_1_2), 
    ExactError(y_implicit_euler_1_4, Evaluate_Analytical_Solution_Exercise2([tstart:1/4:tend]), 1/4, error_flag_implicit_euler_1_4),
    ExactError(y_implicit_euler_1_8, Evaluate_Analytical_Solution_Exercise2([tstart:1/8:tend]), 1/8, error_flag_implicit_euler_1_8),
    ExactError(y_implicit_euler_1_16, Evaluate_Analytical_Solution_Exercise2([tstart:1/16:tend]), 1/16, error_flag_implicit_euler_1_16),
    ExactError(y_implicit_euler_1_32, Evaluate_Analytical_Solution_Exercise2([tstart:1/32:tend]), 1/32, error_flag_implicit_euler_1_32)];

error_adams_moulton = [ExactError(y_adams_moulton_1_2, Evaluate_Analytical_Solution_Exercise2([tstart:1/2:tend]), 1/2, error_flag_adams_moulton_1_2), 
    ExactError(y_adams_moulton_1_4, Evaluate_Analytical_Solution_Exercise2([tstart:1/4:tend]), 1/4, error_flag_adams_moulton_1_4),
    ExactError(y_adams_moulton_1_8, Evaluate_Analytical_Solution_Exercise2([tstart:1/8:tend]), 1/8, error_flag_adams_moulton_1_8),
    ExactError(y_adams_moulton_1_16, Evaluate_Analytical_Solution_Exercise2([tstart:1/16:tend]), 1/16, error_flag_adams_moulton_1_16),
    ExactError(y_adams_moulton_1_32, Evaluate_Analytical_Solution_Exercise2([tstart:1/32:tend]), 1/32, error_flag_adams_moulton_1_32)];

error_adams_moulton_lin1 = [ExactError(y_adams_moulton_lin1_1_2, Evaluate_Analytical_Solution_Exercise2([tstart:1/2:tend]), 1/2), 
    ExactError(y_adams_moulton_lin1_1_4, Evaluate_Analytical_Solution_Exercise2([tstart:1/4:tend]), 1/4),
    ExactError(y_adams_moulton_lin1_1_8, Evaluate_Analytical_Solution_Exercise2([tstart:1/8:tend]), 1/8),
    ExactError(y_adams_moulton_lin1_1_16, Evaluate_Analytical_Solution_Exercise2([tstart:1/16:tend]), 1/16),
    ExactError(y_adams_moulton_lin1_1_32, Evaluate_Analytical_Solution_Exercise2([tstart:1/32:tend]), 1/32)];

error_adams_moulton_lin2 = [ExactError(y_adams_moulton_lin2_1_2, Evaluate_Analytical_Solution_Exercise2([tstart:1/2:tend]), 1/2), 
    ExactError(y_adams_moulton_lin2_1_4, Evaluate_Analytical_Solution_Exercise2([tstart:1/4:tend]), 1/4),
    ExactError(y_adams_moulton_lin2_1_8, Evaluate_Analytical_Solution_Exercise2([tstart:1/8:tend]), 1/8),
    ExactError(y_adams_moulton_lin2_1_16, Evaluate_Analytical_Solution_Exercise2([tstart:1/16:tend]), 1/16),
    ExactError(y_adams_moulton_lin2_1_32, Evaluate_Analytical_Solution_Exercise2([tstart:1/32:tend]), 1/32)];

% Printing the Results

fprintf(' --------- Explicit Euler Method -------------------------------------------------------------- \n ');
fprintf(' dt             1/2           1/4          1/8          1/16          1/32        \n');
fprintf(' error          %f           %f      %f      %f      %f   \n', error_explicit_euler);
fprintf(' error red.     %f           %f      %f      %f      %f\n', ReductionError(error_explicit_euler));
fprintf(' ---------------------------------------------------------------------------------------------- \n');

fprintf(' --------- Method of Heun ---------------------------------------------------------------------- \n ');
fprintf(' dt             1/2           1/4          1/8         1/16            1/32  \n');
fprintf(' error           %f        %f      %f      %f      %f   \n', error_heun_method);
fprintf(' error red.      %f       %f      %f      %f      %f  \n', ReductionError(error_heun_method));
fprintf(' ------------------------------------------------------------------------------------------------  \n');

fprintf(' --------- Implicit Euler Method ---------------------------------------------------------------- \n ');
fprintf(' dt             1/2           1/4          1/8          1/16          1/32        \n');
fprintf(' error       %f       %f      %f      %f      %f \n', error_implicit_euler);
fprintf(' error red.       %f       %f      %f      %f      %f \n', ReductionError(error_implicit_euler));
fprintf(' -------------------------------------------------------------------------------------------------  \n');

fprintf(' --------- Second Order Adams Moulton Method ----------------------------------------------------- \n ');
fprintf(' dt             1/2           1/4          1/8          1/16          1/32        \n');
fprintf(' error           %f       %f      %f      %f      %f \n', error_adams_moulton);
fprintf(' error red.      %f       %f      %f      %f      %f  \n', ReductionError(error_adams_moulton));
fprintf(' --------------------------------------------------------------------------------------------------  \n');

fprintf(' --------- Second Order Adams Moulton Method - Linearisation 1 ------------------------------------ \n ');
fprintf(' dt             1/2           1/4          1/8          1/16          1/32        \n');
fprintf(' error        %f       %f      %f      %f      %f \n', error_adams_moulton_lin1);
fprintf(' error red.       %f       %f      %f      %f      %f \n', ReductionError(error_adams_moulton_lin1));
fprintf(' ---------------------------------------------------------------------------------------------------  \n');

fprintf(' --------- Second Order Adams Moulton Method - Linearisation 2 -------------------------------------- \n ');
fprintf(' dt             1/2           1/4          1/8          1/16          1/32        \n');
fprintf(' error      %f       %f      %f      %f      %f  \n', error_adams_moulton_lin2);
fprintf(' error red.     %f       %f      %f      %f      %f  \n', ReductionError(error_adams_moulton_lin2));
fprintf(' ----------------------------------------------------------------------------------------------------- \n');

% Exercise (i) Stability Criterion:

% Get Variables with array of methods for each timestep with 'X' for stable
% and '-' for unstable and print the result.

% for implicit euler and Adams Moulton method, we have error_flags where newton
%method fails. We use that as an additional criterion (optional argument)

value_stability_dt_1_2 = [IsMethodStable(y_explicit_euler_1_2),
                         IsMethodStable(y_heun_method_1_2),
                         IsMethodStable(y_implicit_euler_1_2, error_flag_implicit_euler_1_2),
                         IsMethodStable(y_adams_moulton_1_2, error_flag_adams_moulton_1_2),
                         IsMethodStable(y_adams_moulton_lin1_1_2),
                         IsMethodStable(y_adams_moulton_lin2_1_2)];
                         
value_stability_dt_1_4 = [IsMethodStable(y_explicit_euler_1_4),
                         IsMethodStable(y_heun_method_1_4),
                         IsMethodStable(y_implicit_euler_1_4, error_flag_implicit_euler_1_4),
                         IsMethodStable(y_adams_moulton_1_4, error_flag_adams_moulton_1_4),
                         IsMethodStable(y_adams_moulton_lin1_1_4),
                         IsMethodStable(y_adams_moulton_lin2_1_4)];                   

value_stability_dt_1_8 = [IsMethodStable(y_explicit_euler_1_8),
                         IsMethodStable(y_heun_method_1_8),
                         IsMethodStable(y_implicit_euler_1_8, error_flag_implicit_euler_1_8),
                         IsMethodStable(y_adams_moulton_1_8, error_flag_adams_moulton_1_8),
                         IsMethodStable(y_adams_moulton_lin1_1_8),
                         IsMethodStable(y_adams_moulton_lin2_1_8)];
                     
value_stability_dt_1_16 = [IsMethodStable(y_explicit_euler_1_16),
                         IsMethodStable(y_heun_method_1_16),
                         IsMethodStable(y_implicit_euler_1_16, error_flag_implicit_euler_1_16),
                         IsMethodStable(y_adams_moulton_1_16, error_flag_adams_moulton_1_16),
                         IsMethodStable(y_adams_moulton_lin1_1_16),
                         IsMethodStable(y_adams_moulton_lin2_1_16)];    

value_stability_dt_1_32 = [IsMethodStable(y_explicit_euler_1_32),
                         IsMethodStable(y_heun_method_1_32),
                         IsMethodStable(y_implicit_euler_1_32, error_flag_implicit_euler_1_32),
                         IsMethodStable(y_adams_moulton_1_32, error_flag_adams_moulton_1_32),
                         IsMethodStable(y_adams_moulton_lin1_1_32),
                         IsMethodStable(y_adams_moulton_lin2_1_32)];
            
fprintf(' -------------------     STABILITY OF METHODS FOR VARIOUS TIMESTEPS    -------------------------------------------------- \n');
fprintf('           | Explicit Euler |Method of Heun |Implicit Euler |Adams Moulton |Adams Moulton L1 |Adams Moulton L2 |\n');
fprintf(' dt = 1/2  |    %c           |    %c          |      %c        |      %c       |       %c         |        %c       |\n', value_stability_dt_1_2);
fprintf(' dt = 1/4  |    %c           |    %c          |      %c        |      %c       |       %c         |        %c       |\n', value_stability_dt_1_4);
fprintf(' dt = 1/8  |    %c           |    %c          |      %c        |      %c       |       %c         |        %c       |\n', value_stability_dt_1_8);
fprintf(' dt = 1/16 |    %c           |    %c          |      %c        |      %c       |       %c         |        %c       |\n', value_stability_dt_1_16);
fprintf(' dt = 1/32 |    %c           |    %c          |      %c        |      %c       |       %c         |        %c       |\n', value_stability_dt_1_32);
fprintf(' -------------------------------------------------------------------------------------------------------------------------- \n');


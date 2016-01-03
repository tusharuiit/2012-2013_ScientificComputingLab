% Exercise (a)
X = [-15:0.2:15];   %domain var
Y = EvalFunc(X);
figure(1);
plot(X, Y, 'b-', X, Y, 'ro');
title('Exercise (a) - Plotting the graph of function');
xlabel('t');
ylabel('p(t)');

% Exercise (c)
%Initialization of variables for various dt
X1 = [0:1:5];
X2 = [0:1/2:5]; 
X3 = [0:1/4:5]; 
X4 = [0:1/8:5];
Yexact = EvalFunc(X4);

%Explicit Euler Method
Y1e = ExpEuler(1, 1, 5);
Y2e = ExpEuler(1, 1/2, 5);
Y3e = ExpEuler(1, 1/4, 5);
Y4e = ExpEuler(1, 1/8, 5);
figure(2);
plot(X1, Y1e, 'b', X2, Y2e, 'g', X3, Y3e, 'r', X4, Y4e, 'y', X4, Yexact, 'k')
legend('blue - dt = 1', 'green - dt = 1/2', 'red - dt = 1/4', 'yellow - dt = 1/8', 'black - exact', 'Location', 'SouthEast');
title('Exercise (b) - Explicit Euler Method');
xlabel('t');
ylabel('p(t)');
ExactErrEuler = [ExactError(Y1e, EvalFunc(X1), 1), ExactError(Y2e, EvalFunc(X2), 1/2), ExactError(Y3e, EvalFunc(X3), 1/4), ExactError(Y4e, EvalFunc(X4), 1/8)]
% Method of Heun
Y1h = HeunMethod(1, 1, 5);
Y2h = HeunMethod(1, 1/2, 5);
Y3h = HeunMethod(1, 1/4, 5);
Y4h = HeunMethod(1, 1/8, 5);
figure(3);
plot(X1, Y1h, 'b', X2, Y2h, 'g', X3, Y3h, 'r', X4, Y4h, 'y', X4, Yexact, 'k')
legend('blue - dt = 1', 'green - dt = 1/2', 'red - dt = 1/4', 'yellow - dt = 1/8', 'black - exact', 'Location', 'SouthEast');
title('Exercise (b) - Method of Heun');
xlabel('t');
ylabel('p(t)');
ExactErrHeun = [ExactError(Y1h, EvalFunc(X1), 1), ExactError(Y2h, EvalFunc(X2), 1/2), ExactError(Y3h, EvalFunc(X3), 1/4), ExactError(Y4h, EvalFunc(X4), 1/8)]

% Runge Kutta Method
Y1r = RungeKutta(1, 1, 5);
Y2r = RungeKutta(1, 1/2, 5);
Y3r = RungeKutta(1, 1/4, 5);
Y4r = RungeKutta(1, 1/8, 5);
figure(4);
plot(X1, Y1r, 'b', X2, Y2r, 'g', X3, Y3r, 'r', X4, Y4r, 'y', X4, Yexact, 'k')
legend('blue - dt = 1', 'green - dt = 1/2', 'red - dt = 1/4', 'yellow - dt = 1/8', 'black - exact', 'Location', 'SouthEast');
title('Exercise (b) - Runge Kutta Method');
xlabel('t');
ylabel('p(t)');
format long;
ExactErrRungeKutta = [ExactError(Y1r, EvalFunc(X1), 1), ExactError(Y2r, EvalFunc(X2), 1/2), ExactError(Y3r, EvalFunc(X3), 1/4), ExactError(Y4r, EvalFunc(X4), 1/8)]
format short;

% Exercise (d)


% Exercise (e)
ApproxErrEuler = [ApproxError(Y1e, Y4e, 1), ApproxError(Y2e, Y4e, 1/2), ApproxError(Y3e, Y4e, 1/4), ApproxError(Y4e, Y4e, 1/8)]
ApproxErrHeun = [ApproxError(Y1h, Y4h, 1), ApproxError(Y2h, Y4h, 1/2), ApproxError(Y3h, Y4h, 1/4), ApproxError(Y4h, Y4h, 1/8)]
format long;
ApproxErrRungeKutta = [ApproxError(Y1r, Y4r, 1), ApproxError(Y2r, Y4r, 1/2), ApproxError(Y3r, Y4r, 1/4), ApproxError(Y4r, Y4r, 1/8)]
format short;
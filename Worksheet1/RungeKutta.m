function Y = RungeKutta( y0, dt, tend )
%RungeKutta - Evaluates value of function numerically based on Runge Kutta
%4th order Method

n = tend / dt;
for i = 1:n
    tcurr = i*dt;
    if(i == 1)
        Ydot1 = EvalFuncDer(y0);
        ytemp = y0 + ((dt/2) * Ydot1); 
        Ydot2 = EvalFuncDer(ytemp);
        ytemp = y0 + ((dt/2) * Ydot2);
        Ydot3 = EvalFuncDer(ytemp);
        ytemp = y0 + (dt * Ydot3);
        Ydot4 = EvalFuncDer(ytemp);
        Y(1) = y0 + (1/6)*dt*(Ydot1 + 2*Ydot2 + 2*Ydot3 + Ydot4);
    else
        Ydot1 = EvalFuncDer(Y(i-1));
        ytemp = Y(i-1) + ((dt/2) * Ydot1); 
        Ydot2 = EvalFuncDer(ytemp);
        ytemp = Y(i-1) + ((dt/2) * Ydot2);
        Ydot3 = EvalFuncDer(ytemp);
        ytemp = Y(i-1) + (dt * Ydot3);
        Ydot4 = EvalFuncDer(ytemp);
        Y(i) = Y(i-1) + (1/6)*dt*(Ydot1 + 2*Ydot2 + 2*Ydot3 + Ydot4);
    end
end
Y = [y0, Y];
end
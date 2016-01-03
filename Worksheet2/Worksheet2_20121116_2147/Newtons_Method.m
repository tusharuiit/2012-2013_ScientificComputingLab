function [error_flag, y_newton] = Newtons_Method(y_initial_guess, func, func_der)
error_flag = 0;
delta = 10^-4;
count = 0;
while count < 100
    y_newton = y_initial_guess - (func(y_initial_guess) / func_der(y_initial_guess));
    if (abs(y_initial_guess-y_newton)<delta)
        break
    else
        y_initial_guess = y_newton;
        count = count + 1;
    end
end

if count >= 100
    error_flag = 1;
end

end


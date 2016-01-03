function x = newton(xs,func)
delta = 10^-4;
c = 0;
while c < 30
    x = xs - func(xs) / ((func(xs+delta)-func(xs)) / delta);
    if abs(xs-x)<delta
        break
    else
        xs = x;
        c = c + 1;
    end
end

if c == 30
    error('Newton-Method did not converge!')
end
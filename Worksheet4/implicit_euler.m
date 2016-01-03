function T_new = implicit_euler(T,nx,ny,dt)
    % T(i,j,t+1) = T(i,j,t) + dt * T_t(i,j,t+1)
    T_new = T;
    hx_sq = (1 / (nx + 1)) ^2;
    hy_sq = (1 / (ny + 1)) ^2;
    while true
        for i=2:nx+1
            for j=2:ny+1
                func = @(T_calc) T(i,j) + ((T_new(i-1,j) - 2 * T_calc + T_new(i+1,j)) / hx_sq + (T_new(i,j-1) - 2 * T_calc + T_new(i,j+1)) / hy_sq) * dt - T_calc;
                T_new(i,j) = newton(T(i,j),func);
            end
        end
        r = residual_norm(T_new);
        if r < 10^-4
            break;
        end
    end
end
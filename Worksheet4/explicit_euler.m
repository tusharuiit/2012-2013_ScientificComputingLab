function T_new = explicit_euler(T,nx,ny,dt)
    % T(i,j,t+1) = T(i,j,t) + dt * T_t(i,j,t)
    T_new = T;
    hx_sq = (1 / (nx + 1)) ^2;
    hy_sq = (1 / (ny + 1)) ^2;
    for i=2:nx+1
        for j=2:ny+1
            T_new(i,j)=T(i,j) + ((T(i-1,j) - 2 * T(i,j) + T(i+1,j)) / hx_sq + (T(i,j-1) - 2 * T(i,j) + T(i,j+1)) / hy_sq) * dt;
        end
    end
end

clear
clc
close all
% Worksheet 4

% a)
% T_t = T_xx+T_yy <= 0 for all x,y
% After inf time steps T_t = T_xx+T_yy = 0                      (I)
% Homogenous Dirichlet boundary conditions                      (II)
% (I) and (II) => For all x,y: T(x,y)=0

% b)
% sol_new = explicit_euler(sol,nx,ny,dt);

% c)
t = [1/8, 2/8, 3/8, 4/8];
dt = [1/64, 1/128, 1/256, 1/512, 1/1024, 1/2048, 1/4096];
% nx = ny = n
n = [3,7,15,31];

% initialize stability table
stable = ones(length(n),length(dt));
% initialize Temperature distribution at time t=0 as cell-array (n x dt)
solution_init = cell(length(n),length(dt));
for i = 1:length(n)
    entry = ones(n(i)+2,n(i)+2);
    entry(1,:) = 0;
    entry(n(i)+2,:) = 0;
    entry(:,1) = 0;
    entry(:,n(i)+2) = 0;
    for j = 1:length(dt)
        solution_init(i,j) = {entry};
    end
end

% iterate over time points t
for k = 1:length(t)
    figure(k);
    set(gcf,'name',sprintf('Computed solutions with explicit Euler method at t = %fs',t(k)));
    % counter for subplot position
    counter = 1;
    % iterate over grid size
    for i = 1:length(n)
        [x,y] = meshgrid(0:1/(n(i)+1):1,0:1/(n(i)+1):1);
        % iterate over time steps
        for j = 1:length(dt)
            time = 0;
            sol = cell2mat(solution_init(i,j));
            while time<=t(k)
                sol = explicit_euler(sol,n(i),n(i),dt(j));
                if max(max(sol)) > 1
                    stable(i,j)=false;
                end
                solution_init(i,j) = {sol};
                time = time + dt(j);
            end
            % arrange subplots
            subplot(length(n),length(dt),counter);
            counter = counter +1;
            
            % plot solution into subplot
            set(gcf,'renderer','zbuffer')
            surf(x,y,sol)
            title({sprintf('N = %i', n(i)); sprintf('dt = 1/%i s',1/dt(j))})
            
            % save plot as jpg
            fig = figure('renderer','zbuffer','visible','off');
            surf(x,y,sol)
            title(sprintf('N = %i, dt = 1/%i [s]', n(i),1/dt(j)))
            filename = sprintf('plot_n=%i_dt=1div%i_t=%idiv8', n(i), 1/dt(j), t(k)*8);
            print(fig,filename,'-djpeg')
            
            % return to figure with subplots
            figure(k)
        end
    end
end

fprintf('\nStability Table - explicit Euler\n')
fprintf('================================\n\n')
fprintf('       dt =  1/64   1/128   1/256   1/512   1/1024   1/2048   1/4096\n')
fprintf('n =    ++----------------------------------------------------------\n')
for i = 1:length(n)
    fprintf('   %2.i  ||     %i      %i       %i       %i       %i        %i        %i\n', n(i), stable(i,:))
end


% d)
% sol_new = implicit_euler(sol,nx,ny,dt);

% e)
t = [1/8, 2/8, 3/8, 4/8];
dt = 1/64;
% nx = ny = n
n = [3,7,15];

% initialize stability table
stable = ones(length(n),1);
% initialize Temperature distribution at time t=0 as cell-array (n x dt)
solution_init = cell(length(n),1);
for i = 1:length(n)
    entry = ones(n(i)+2,n(i)+2);
    entry(1,:) = 0;
    entry(n(i)+2,:) = 0;
    entry(:,1) = 0;
    entry(:,n(i)+2) = 0;
    solution_init(i) = {entry};
end

figure(5)
set(gcf,'name','Computed solutions with implicit Euler method for dt = 1/64 [s]');
% counter for subplot position
counter = 1;
% iterate over grid size
for i = 1:length(n)
    [x,y] = meshgrid(0:1/(n(i)+1):1,0:1/(n(i)+1):1);
    % iterate over over time points t
    for k = 1:length(t)
        time = 0;
        sol = cell2mat(solution_init(i));
        while time<=t(k)
            sol = implicit_euler(sol,n(i),n(i),dt);
            if max(max(sol)) > 1
                stable(i,1)=false;
            end
            solution_init(i) = {sol};
            time = time + dt;
        end
        % arrange subplots
        subplot(length(n),length(t),counter)
        counter = counter +1;
        % plot solution into subplot
        surf(x,y,sol);
        title(sprintf('N = %i, t = %f [s]', n(i),t(k)))
    end
end

fprintf('Stability Table - implicit Euler\n')
fprintf('================================\n\n')
fprintf('       dt =  1/64\n')
fprintf('n =    ++--------\n') 
for i = 1:length(n)
    fprintf('   %2.i  ||     %i\n', n(i), stable(i))
end
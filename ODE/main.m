%problem one - part a
%let S be the concentration, t be the time
%also the amount of water getting in and out is the same
%in other words, the size is constant
% dA/dt = 1 - A / 15
% dA/dt = (15 - A) /15
% dA / (15 - A) = dt/15
% - ln(15-A) + c = t/15 
% C(15 - A) = e^(-t/15)
% C * A = C * 15 - e^(-t/15)
% C = -1/35

%problem one - part a -- plotting
x_vals = 0 :0.5: 5;
fx_vals = arrayfun(@Concentration, x_vals);
%disp(x_vals);
%disp(fx_vals);
plot(x_vals,fx_vals);
hold on

%problem one - part b
[Euler_x_vals, Euler_fx_vals] = Euler(0, 5, 0.5,50 , @AmountDerivative);
plot(Euler_x_vals, Euler_fx_vals); 


%problem one - part c
[MidPoint_x_vals, MidPoint_fx_vals] = MidPoint(0, 5, 0.5,50 , @AmountDerivative);
plot(MidPoint_x_vals, MidPoint_fx_vals);

%problem one - part D
[Heun_x_vals, Heun_fx_vals] = Heun(0, 5, 0.5,50,-1, @AmountDerivative);
plot(Heun_x_vals, Heun_fx_vals);

%problem one - part E
[Heun_iterations_x_vals, Heun_iterations_fx_vals] = Heun(0, 5, 0.5,50,10, @AmountDerivative);
plot(Heun_iterations_x_vals, Heun_iterations_fx_vals);

%problem one - part F
[RungeKutta_x_vals, RungeKutta_fx_vals] = RungeKutta4th(0, 5, 1 ,50 , @AmountDerivative);
plot(RungeKutta_x_vals, RungeKutta_fx_vals);

legend('Analytical','Euler','MidPoint','Heun','Heun10%', '4thRungeKutta');
hold off


%problem one - part g
% According to the results, the values gets least accuracy 
% with the method euler because it only uses the 
%first term of the euler approximations
% the smaller the used intervals, the more accuracy you get.
% the Runge-Kutta was the second least accuracy and this may 
% be because to the relatively less interval width
% also euler's method gets its accuracy decreased with each 
% time it predicts something in the cycle/

%problem two - part a
start_time = 0;
endtime = 4;
time_interval = 0.1;
velocity_initial_x = cosd(50) * 2.25;
velocity_initial_z = sind(50) * 2.25;
[x_vals_problem_two, z_vals_problem_two, velocity_x, velocity_z] = RungeKutta4th_2D(start_time, endtime, time_interval, start_time, endtime, time_interval,  velocity_initial_x,  velocity_initial_z , @Def_DVX, @Def_DVZ);

position_x = [0];
position_z = [1.85];
for ind = 1 : length(velocity_x) - 1
    position_x = [position_x(:);   position_x(ind) + time_interval * velocity_x(ind)];
    position_z = [position_z(:);   position_z(ind) + time_interval * velocity_z(ind)];
end

negZ = find(position_z <= 0);
position_x = position_x(1:negZ-1);
position_z = position_z(1:negZ-1);

%problem two - part b
t = start_time:time_interval:endtime;
[t,Velocities] = ode45(@ODE45Func,t,[velocity_initial_x,velocity_initial_z]);

position_x_matlab = [0];
position_z_matlab = [1.85];
for ind = 1 : length(Velocities) - 1
    position_x_matlab = [position_x_matlab(:);   position_x_matlab(ind) + time_interval * Velocities(ind,1)];
    position_z_matlab = [position_z_matlab(:);   position_z_matlab(ind) + time_interval * Velocities(ind,2)];
end

negZ = find(position_z_matlab <= 0);
position_x_matlab = position_x_matlab(1:negZ-1);
position_z_matlab = position_z_matlab(1:negZ-1);


%problem two - plotting
figure()
hold on
plot(position_x, position_z);
plot(position_x_matlab, position_z_matlab);
legend('4thRungeKutta','ODE45');
title("The trajectory of the ball as seen from side view");
hold off

%problem two - part c
% the start conditions are not ideal because the ball does not
% reach a height of about 3 meter so that the ball can get a possible shot
% Maybe it can instead increase its velocity :D


%problem three - part d
% over the long term the results of the ODE matlab function and my RungeKutta
% implementation starts to increase and this is because each time you use the 
% method to calculate the next value, you approximate it and therefore an error
% starts to accumlate with iterations.
%the start of the main script used to solve the assignment

f1 = figure;
%Problem one
%getting data using trapezoidal method
[x_trapezoidal, moment_trapezoidal] = Trapezoidal(0, 6, 0.1, @Def_Moment);
theta_trapezoidal = arrayfun(@Def_Slope_Theta, moment_trapezoidal);
subplot(4,2,3);
plot(x_trapezoidal, theta_trapezoidal, '-o');
title('Trapezoidal Method')
xlabel('Distance (m)') 
ylabel('Slope') 


%getting data using Simpson's 1/3 method
[x_Simpson_one_three, moment_Simpson_one_three] = Simpson_one_three(0, 6, 0.5, @Def_Moment);
theta_Simpson_one_three = arrayfun(@Def_Slope_Theta, moment_Simpson_one_three);
subplot(4,2,4);
plot(x_Simpson_one_three, theta_Simpson_one_three, '-o');
title('Simpsons 1/3 Method')
xlabel('Distance (m)') 
ylabel('Slope') 


%getting data using Simpson's 3/8 method
[x_Simpson_three_eight, moment_Simpson_three_eight] = Simpson_three_eight(0, 6, 0.5, @Def_Moment);
theta_Simpson_three_eight = arrayfun(@Def_Slope_Theta, moment_Simpson_three_eight);
subplot(4,2,5);
plot(x_Simpson_three_eight, theta_Simpson_three_eight, '-o');
title('Simpsons 3/8 Method')
xlabel('Distance (m)') 
ylabel('Slope')


%getting data using default trapz function
[x_trapz, moment_trapz] = Moment_trapz_builtin_func(0, 6, 0.1, @Def_Moment);
theta_trapz = arrayfun(@Def_Slope_Theta, moment_trapz);
subplot(4,2,6);
plot(x_trapz, theta_trapz, '-o');
title('trapz function')
xlabel('Distance (m)') 
ylabel('Slope')


x_diff_func_vals = arrayfun(@Def_Moment, x_trapz);
subplot(4,2,(1:2));
plot(x_trapz, x_diff_func_vals, '-o');
title('Simpsons 1/3 Method')
xlabel('Distance (m)') 
ylabel('Moment')


pars = num2cell([6 3 30 0.001]);
[beam_l, beam_w, beam_e, beam_i] = deal(pars{:});
theta_end_ground_truth = (beam_w * beam_l^3) / (45 * beam_e * beam_i)

%because the M(x) has a local maximum in the middle of the range and it is
%a polynomial function ... the results are very close to each other
%because what could be extra added in the second half of the range will be
%similiarly removed in the first half 


%f2 = figure;
%defelection using simpson 1/3 rule after trapezoidal rule
[x_deflection, deflection_f] = Simpson_one_three_By_Vals(x_trapz,theta_trapz);
subplot(4,2,(7:8));
plot(x_deflection, deflection_f, '-o');
title('Simpsons 1/3 Method after trapezoidal rule')
xlabel('Distance (m)') 
ylabel('Deflection')





f2 = figure;
%Calculating shear vs position
%First forward
[x_vals_shear_first_forward , x_f_shear_first_forward ] = First_Difference_Method(0, 6, 0.1, 2, @Def_Moment);
subplot(3,2,1);
plot(x_vals_shear_first_forward, x_f_shear_first_forward, '-o');
title('First forward')
xlabel('Distance (m)') 
ylabel('Shear')



%first backword
[x_vals_shear_first_backword , x_f_shear_first_backword ] = First_Difference_Method(0, 6, 0.1, 1, @Def_Moment);
subplot(3,2,2);
plot(x_vals_shear_first_backword, x_f_shear_first_backword, '-o');
title('First backward')
xlabel('Distance (m)') 
ylabel('Shear')



%first centered
[x_vals_shear_first_centered , x_f_shear_first_centered ] = First_Difference_Method(0, 6, 0.1, 3, @Def_Moment);
subplot(3,2,3);
plot(x_vals_shear_first_centered, x_f_shear_first_centered, '-o');
title('First centered')
xlabel('Distance (m)') 
ylabel('Shear')



%higher order centered
[x_vals_shear_higher_centered , x_f_shear_higher_centered ] = Higher_Centered_difference(0, 6, 0.1, @Def_Moment);
subplot(3,2,4);
plot(x_vals_shear_higher_centered, x_f_shear_higher_centered, '-o');
title('higher order centered')
xlabel('Distance (m)') 
ylabel('Shear')


%using diff
[x_vals_shear_builtin , x_f_shear_builtin ] = First_Difference_builtin_func(0, 6, 0.1, @Def_Moment);
subplot(3,2,5);
plot(x_vals_shear_builtin, x_f_shear_builtin, '-o');
title('using diff')
xlabel('Distance (m)') 
ylabel('Shear')


%I am most confident with the higher order centered difference method
%because the moment function is of a third degree and the higher order in
%this case provides information that is ignored by lower ones 

%calculating shear at 3.12
shear_3_12 = Def_Moment(3.10) + x_f_shear_higher_centered(31) * 0.02


%plotting load
[x_vals_load , x_f_load ] = Second_Forward_Method(0, 6, 0.1, @Def_Moment);
subplot(3,2,6);
plot(x_vals_load, x_f_load .* - 1, '-o');
title('using second forward method')
xlabel('Distance (m)') 
ylabel('Load')

%the resulting load calculations are not exact but are a good approximation

%problem 2 starts here
%analytically
%M = 3/8 (xyz)^2 + xyz + c >>
%substituting with boundaries >>
%M = 3/8 + 1 = 11/8
disp("Mass analytically = 11/8 = 1.37500")

%using trapezoidal rule and symmetry
[x_cube_trapezoidal, x_cube_term_one_trapezoidal] = Trapezoidal(0, 1, 0.25, @f_equal_x);
[x_cube_trapezoidal_2, x_cube_term_two_trapezoidal] = Trapezoidal(0, 1, 0.25, @f_equal_one);
mass_trapezoidal = 3 * (x_cube_term_one_trapezoidal(end))^3 + (x_cube_term_two_trapezoidal(end))^3
%disp('using trapezoidal = ', mass_trapezoidal)

%using simpson 1/3 rule and symmetry
[x_cube_simpson, x_cube_term_one_simpson] = Simpson_one_three(0, 1, 0.25, @f_equal_x);
[x_cube_simpson_2, x_cube_term_two_simpson] = Simpson_one_three(0, 1, 0.25, @f_equal_one);
mass_simpson = 3 * (x_cube_term_one_simpson(end))^3 + (x_cube_term_two_simpson(end))^3
%disp('using simpson = ', mass_simpson)


%since the function is a polynomial of max degree one then an approximation
%of second order (simpson) does not add more info than an approximation of
%first order (trapezoidal)

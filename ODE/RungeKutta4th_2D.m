function [x_vals, z_vals, fx_val_x, fx_val_z] = RungeKutta4th_2D(x_start, x_end, x_interval_width, z_start, z_end, z_interval_width,  f_initial_x,  f_initial_z , DX, DZ)

    x_vals = x_start : x_interval_width : x_end;
    z_vals = z_start : z_interval_width : z_end;
    
    fx_val_x = [f_initial_x];
    fx_val_z = [f_initial_z];
    if (length(x_vals) == length(z_vals))
        evalutions_count = length(x_vals) - 1;
        for ind = 1: evalutions_count
            k_one_x = DX(x_vals(ind),z_vals(ind),fx_val_x(ind),fx_val_z(ind));
            k_one_z = DZ(x_vals(ind),z_vals(ind),fx_val_x(ind),fx_val_z(ind));


            k_two_x = DX(x_vals(ind) + x_interval_width/2, z_vals(ind) + z_interval_width/2, fx_val_x(ind) + k_one_x * x_interval_width/2, fx_val_z(ind) + k_one_z * z_interval_width/2);
            k_two_z = DZ(x_vals(ind) + x_interval_width/2, z_vals(ind) + z_interval_width/2, fx_val_x(ind) + k_one_x * x_interval_width/2, fx_val_z(ind) + k_one_z * z_interval_width/2);        


            k_three_x = DX(x_vals(ind) + x_interval_width/2, z_vals(ind) + z_interval_width/2, fx_val_x(ind) + k_two_x*x_interval_width/2, fx_val_z(ind) + k_two_z*z_interval_width/2);
            k_three_z = DZ(x_vals(ind) + x_interval_width/2, z_vals(ind) + z_interval_width/2, fx_val_x(ind) + k_two_x*x_interval_width/2, fx_val_z(ind) + k_two_z*z_interval_width/2);

            
            k_four_x = DX(x_vals(ind+1),z_vals(ind+1), fx_val_x(ind) + k_three_x * x_interval_width, fx_val_z(ind) + k_three_z * z_interval_width);            
            k_four_z = DZ(x_vals(ind+1),z_vals(ind+1), fx_val_x(ind) + k_three_x * x_interval_width, fx_val_z(ind) + k_three_z * z_interval_width);


            fx_target_x = fx_val_x(ind) + (k_one_x + 2*k_two_x + 2*k_three_x + k_four_x) * x_interval_width/6;
            fx_target_z = fx_val_z(ind) + (k_one_z + 2*k_two_z + 2*k_three_z + k_four_z) * z_interval_width/6;

            fx_val_x = [fx_val_x(:); fx_target_x];
            fx_val_z = [fx_val_z(:); fx_target_z];
        end
    else
        disp("Dude use equal sizes in each of x and z vals");
end

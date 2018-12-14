function [x_vals,fx_vals] = RungeKutta4th(x_start, x_end, interval_width, f_initial , f)

    x_vals = x_start : interval_width : x_end;
    
    fx_vals = [f_initial];
    evalutions_count = length(x_vals) - 1;
    for ind = 1: evalutions_count

        k_one = f(x_vals(ind), fx_vals(ind));
        k_two = f(x_vals(ind) + interval_width/2, fx_vals(ind) + k_one*interval_width/2);
        k_three = f(x_vals(ind) + interval_width/2, fx_vals(ind) + k_two*interval_width/2);
        k_four = f(x_vals(ind+1), fx_vals(ind) + k_three * interval_width);

        fx_target = fx_vals(ind) + (k_one + 2*k_two + 2*k_three + k_four) * interval_width/6;

        fx_vals = [fx_vals(:); fx_target];
    end
    
end
function [x_vals,fx_vals] = Heun(x_start, x_end, interval_width, f_initial, relative_error , f)

    x_vals = x_start : interval_width : x_end;
    
    fx_vals = [f_initial];
    evalutions_count = length(x_vals) - 1;
    for ind = 1: evalutions_count
        slope = f(x_vals(ind), fx_vals(ind));

        fx_iter = fx_vals(ind) + slope * interval_width;

        slope_iter = f(x_vals(ind + 1), fx_iter);

        slope_corrector = (slope + slope_iter) / 2;

        fx_target = fx_vals(ind) + slope_corrector * interval_width;

        while (abs((fx_target - fx_iter)/fx_target * 100) > relative_error) & (relative_error ~= -1)
            fx_iter = fx_target;

            slope_iter = f(x_vals(ind + 1), fx_iter);
    
            slope_corrector = (slope + slope_iter) / 2;
    
            fx_target = fx_vals(ind) + slope_corrector * interval_width;
        end

        fx_vals = [fx_vals(:); fx_target];
    end
    
end
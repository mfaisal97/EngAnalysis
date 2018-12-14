function [x_vals,fx_vals] = MidPoint(x_start, x_end, interval_width,f_initial , f)

    x_vals = x_start : interval_width : x_end;
    
    fx_vals = [f_initial];
    evalutions_count = length(x_vals) - 1;
    for ind = 1: evalutions_count
        slope = f(x_vals(ind), fx_vals(ind));

        fx_mid = fx_vals(ind) + slope * interval_width/2;

        slope_mid = f(x_vals(ind) + interval_width/2, fx_mid);

        fx_vals = [fx_vals(:); fx_vals(ind) + slope_mid * interval_width];
    end
    
end
function [x_vals,fx_vals] = Euler(x_start, x_end, interval_width,f_initial , f)

    x_vals = x_start : interval_width : x_end;
    
    fx_vals = [f_initial];
    evalutions_count = length(x_vals) - 1;
    %disp(fx_vals)
    for ind = 1: evalutions_count
        %disp(fx_vals(ind))
        fx_vals = [fx_vals(:); (fx_vals(ind) + interval_width * f(x_vals(ind) ,fx_vals(ind)))];
    end
    
end
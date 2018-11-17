function [x_vals,fx_diff] = First_Difference_builtin_func(x_start, x_end, interval_width, f)

    x_vals = x_start : interval_width : x_end;
    x_vals = [ (x_start - interval_width); x_vals(:)];
    x_func_vals = arrayfun(f, x_vals);

    fx_diff =  diff(x_func_vals) / interval_width;
    x_vals = x_vals(2:end);
        
end
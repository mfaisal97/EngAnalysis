function [x_vals,fx_diff] = Second_Forward_Method(x_start, x_end, interval_width, f)

    x_vals = x_start : interval_width : x_end;
    x_vals = [x_vals(:);  (x_end + interval_width) ;  (x_end + 2*interval_width)];
    x_func_vals = arrayfun(f, x_vals);

    segments_count = length(x_vals) - 2;

    fx_diff = [];
    
    for x_num = 1: segments_count
        fx_diff = [fx_diff(:); ((x_func_vals(x_num + 2) - 2 *  x_func_vals(x_num + 1) + x_func_vals(x_num)) / (interval_width^2))];
    end
    
    x_vals = x_vals(1 : end - 2);
    
end
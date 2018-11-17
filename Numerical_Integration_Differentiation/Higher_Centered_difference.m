function [x_vals,fx_diff] = Higher_Centered_difference(x_start, x_end, interval_width, f)

    x_vals = x_start : interval_width : x_end;
    x_vals = [(x_start - interval_width);  x_vals(:);  (x_end + interval_width)];
    x_vals = [(x_start - 2 * interval_width);  x_vals(:);  (x_end + 2*interval_width)];
    x_func_vals = arrayfun(f, x_vals);

    segments_count = length(x_vals) - 2;

    fx_diff = [];
    
    for x_num = 3: segments_count
        fx_diff = [fx_diff(:); ((0 - x_func_vals(x_num + 2) + 8 * x_func_vals(x_num + 1) -8 * x_func_vals(x_num - 1) + x_func_vals(x_num - 2)) / (12*interval_width))];
    end
    
    x_vals = x_vals(3:end - 2);
    
end
function [x_vals,fx] = Moment_trapz_builtin_func(x_start, x_end, interval_width, f)

    x_vals = x_start : interval_width : x_end;
    x_diff_func_vals = arrayfun(f, x_vals);

    segments_count = length(x_vals) - 1;

    fx = [0];
    for x_num = 1: segments_count
        fx = [fx(:); (trapz(x_vals(1:x_num + 1), x_diff_func_vals(1:x_num + 1)))];
    end

end
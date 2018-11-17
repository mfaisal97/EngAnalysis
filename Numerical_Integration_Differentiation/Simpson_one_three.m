function [x_vals,fx] = Simpson_one_three(x_start, x_end, interval_width, f)

    x_vals = x_start : interval_width : x_end;
    x_diff_func_vals = arrayfun(f, x_vals);

    segments_count = length(x_vals) - 1;

    fx = [0];
    total_area = 0;
    for x_num = 1: segments_count
        mid_val = (x_vals(x_num) + x_vals(x_num + 1)) / 2;
        mid_val_func = f(mid_val);
        current_area = interval_width * (x_diff_func_vals(x_num) + 4*mid_val_func + x_diff_func_vals(x_num + 1)) / 6;
        total_area = total_area + current_area;

        fx = [fx(:); total_area];
    end

end
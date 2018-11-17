function [x_vals,fx] = Trapezoidal(x_start, x_end, interval_width, f)

    x_vals = x_start : interval_width : x_end;
    x_diff_func_vals = arrayfun(f, x_vals);

    segments_count = length(x_vals) - 1;

    fx = (0);
    total_area = 0;
    for x_num = 1: segments_count
        current_area = interval_width * (x_diff_func_vals(x_num) + x_diff_func_vals(x_num + 1)) / 2;
        total_area = total_area + current_area;

        fx = [fx(:); total_area];
    end

end
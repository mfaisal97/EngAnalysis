function [x_vals,fx_diff] = First_Difference_Method(x_start, x_end, interval_width, diff_mode, f)

    x_vals = x_start : interval_width : x_end;
    x_vals = [(x_start - interval_width);  x_vals(:);  (x_end + interval_width)];
    x_func_vals = arrayfun(f, x_vals);

    segments_count = length(x_vals) - 1;

    fx = [];
    for x_num = 1: segments_count
        fx = [fx(:); ((x_func_vals(x_num + 1) - x_func_vals(x_num)) / interval_width)];
    end

    if (diff_mode == 1)                     %backward
        fx_diff = fx(1: end - 1);
    elseif (diff_mode == 2)                 %forward
        fx_diff = fx(2: end);
    elseif (diff_mode == 3 )                %center
        fx_diff = (fx(2: end) + fx(1: end - 1)) ./ (2) ;
    end
    
    x_vals = x_vals(2:end - 1);
    
end
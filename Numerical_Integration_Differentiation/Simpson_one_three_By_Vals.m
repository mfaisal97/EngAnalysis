function [x_vals_out,fx] = Simpson_one_three_By_Vals(x_vals, x_diff_func_vals)

    if(mod(length(x_diff_func_vals), uint32(2)) ~= 0 )
        x_vals = [x_vals(:); x_vals(end)];
        x_diff_func_vals = [x_diff_func_vals(:) ; x_diff_func_vals(end)];
    end
       
    interval_width = x_vals(3) - x_vals(1);
    x_diff_func_vals = reshape(x_diff_func_vals, [], 2);
    [segments_count, ~] = size(x_diff_func_vals);
    segments_count = segments_count - 1;

    x_vals = reshape(x_vals, [], 2);
    x_vals_out = x_vals(:,1);

    fx = [0];
    total_area = 0;
    for x_num = 1: segments_count
        current_area = interval_width * (x_diff_func_vals(x_num, 1) + 4*x_diff_func_vals(x_num, 2) + x_diff_func_vals(x_num + 1, 1)) / 6;
        total_area = total_area + current_area;

        fx = [fx(:); total_area];
    end

end
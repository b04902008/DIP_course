function [ct_h, ct_v] = domainTransform(J, sigma_s, sigma_r, cum)
    % 1d
    [height, width, channel] = size(J);
    diff_x_c = diff(J, 1, 2);
    diff_y_c = diff(J, 1, 1);
    
    % multichannel
    diff_x = zeros(height, width);
    diff_y = zeros(height, width);
    for c=1:channel
        diff_x(:, 2:end) = diff_x(:, 2:end) + abs(diff_x_c(:, :, c));
        diff_y(2:end, :) = diff_y(2:end, :) + abs(diff_y_c(:, :, c));
    end
    
    % scaling
    ct_h_d = 1 + sigma_s / sigma_r * diff_x;
    ct_v_d = 1 + sigma_s / sigma_r * diff_y;
    
    % intergrating
    if cum == 1
        ct_h = cumsum(ct_h_d, 2);
        ct_v = cumsum(ct_v_d, 1);
    elseif cum == 0
        ct_h = ct_h_d;
        ct_v = ct_v_d;
    end
    ct_v = ct_v';
end
function F = IC(I, J, sigma_s, sigma_r, num_iter)
    % Get Position in the Transformed Domain
    [ct_h, ct_v] = domainTransform(double(J), sigma_s, sigma_r, 1);
    
    F = double(I);
    sigma_H = sigma_s;
    for i = 0:(num_iter - 1)
        sigma_Hi = sigma_H * sqrt(3) * 2^(num_iter - (i + 1)) / sqrt(4^num_iter - 1);
        box_radius = sqrt(3) * sigma_Hi;
        
        F = boxFilter(F, ct_h, box_radius);
        F = transpose3D(F);
        
        F = boxFilter(F, ct_v, box_radius);
        F = transpose3D(F);
    end
    
    F = cast(F, class(I));
end

function F = boxFilter(I, ct, box_radius)
    [height, width, channel] = size(I);
    
    l_bound = ct - box_radius;
    r_bound = ct + box_radius;
    
    l_index = zeros(size(ct));
    r_index = zeros(size(ct));
    
    for h = 1:height
        ct_row = [ct(h, :) inf];
        
        l_index(h, 1) = find(ct_row > l_bound(h, 1), 1, 'first');
        r_index(h, 1) = find(ct_row > r_bound(h, 1), 1, 'first');
        for w = 2:width
            l_index(h, w) = l_index(h, w-1) + ...
                find(ct_row(l_index(h, w-1):end) > l_bound(h, w), 1, 'first') - 1;
            r_index(h, w) = r_index(h, w-1) + ...
                find(ct_row(r_index(h, w-1):end) > r_bound(h, w), 1, 'first') - 1;
        end
    end
    
    area = bsxfun(@times, (I(:, 2:end, :) + I(:, 1:end-1, :)) .* 0.5, ct(:, 2:end, :) - ct(:, 1:end-1, :));
    
    area_cum = zeros([height, width, channel]);
    area_cum(:, 2:end, :) = cumsum(area, 2);
    row_indices = repmat((1:height)', 1, width);
    F = zeros(size(I));
    
    I = padarray(I, [0 1 0], 'replicate');
    ct = padarray(ct, [0 1 0], 'replicate');
    area_cum = padarray(area_cum, [0 1 0]);
    
    ct(:,1) = ct(:,1) - box_radius * 1.2;
    ct(:,end) = ct(:,end) + box_radius * 1.2;
    
    for c = 1:channel
        % Indices for Full Image
        ll_c = sub2ind(size(area_cum), row_indices, l_index, repmat(c, height, width));
        lr_c = sub2ind(size(area_cum), row_indices, l_index + 1, repmat(c, height, width));
        rl_c = sub2ind(size(area_cum), row_indices, r_index, repmat(c, height, width));
        rr_c = sub2ind(size(area_cum), row_indices, r_index + 1, repmat(c, height, width));
        % Indices for Transformed Domain
        ll = sub2ind(size(area_cum), row_indices, l_index);
        lr = sub2ind(size(area_cum), row_indices, l_index + 1);
        rl = sub2ind(size(area_cum), row_indices, r_index);
        rr = sub2ind(size(area_cum), row_indices, r_index + 1);
        % Central Area
        C = area_cum(rl_c) - area_cum(lr_c);
        % Left-side Area
        ratio = (l_bound - ct(ll)) ./ (ct(lr) - ct(ll));
        y = (I(lr_c) - I(ll_c)) .* ratio + I(ll_c);
        L = (y + I(lr_c)) .* (ct(lr) - ct(ll)) .* (1 - ratio) .* 0.5;
        % Right-side Area
        ratio = (r_bound - ct(rl)) ./ (ct(rr) - ct(rl));
        y = (I(rr_c) - I(rl_c)) .* ratio + I(rl_c);
        R = (y + I(rl_c)) .* (ct(rr) - ct(rl)) .* ratio .* 0.5;
        
        F(:, :, c) = (L + C + R) / (2 * box_radius);
    end
end
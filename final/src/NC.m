function [F, Kp] = NC(I, J, sigma_s, sigma_r, num_iter)
    I = double(I);
    J = double(J);
    [ct_h, ct_v] = domainTransform(J, sigma_s, sigma_r, 1);
    
    F = double(I);
    sigma_h = sigma_s;
    for i=1:num_iter
        sigma_hi = sigma_h * sqrt(3) * 2^(num_iter - i) / sqrt(4^num_iter - 1);
        box_radius = sigma_hi * sqrt(3);
        [F, Kp_h] = boxFilter(F, ct_h, box_radius);
        F = transpose3D(F);
        [F, Kp_v] = boxFilter(F, ct_v, box_radius);
        F = transpose3D(F);
        Kp_v = Kp_v';
        if i == 1
            Kp = (Kp_h + Kp_v) / 2;
        end
    end
    F = cast(F, class(I));
end

function [F,Kp] = boxFilter(I, ct, box_radius)
    [height, width, channel] = size(I);
    l_bound = ct - box_radius;
    r_bound = ct + box_radius;

    % find box range
    l_index = zeros(size(ct));
    r_index = zeros(size(ct));
    for h=1:height
        ct_row = [ct(h, :) inf];
        
        l_index(h, 1) = find(ct_row > l_bound(h, 1), 1, 'first');
        r_index(h, 1) = find(ct_row > r_bound(h, 1), 1, 'first');
        for w=2:width
            l_index(h, w) = l_index(h, w-1) + find(ct_row(l_index(h, w-1):end) > l_bound(h, w), 1, 'first') - 1;
            r_index(h, w) = r_index(h, w-1) + find(ct_row(r_index(h, w-1):end) > r_bound(h, w), 1, 'first') - 1;
        end
    end
    Kp = r_index - l_index;

    % sum box range
    SAT = zeros([height, width+1, channel]);
    SAT(:,2:end,:) = cumsum(I, 2);
    row_indices = repmat((1:height)', 1, width);
    F = zeros(size(I));
    for c = 1:channel
        a = sub2ind(size(SAT), row_indices, l_index, repmat(c, height, width));
        b = sub2ind(size(SAT), row_indices, r_index, repmat(c, height, width));
        F(:,:,c) = (SAT(b) - SAT(a)) ./ (r_index - l_index);
    end
end
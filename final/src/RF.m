function F = RF(I, J, sigma_s, sigma_r, num_iter)
    % Get Distance between Neighbors in the Transformed Domain
    [ct_h_d, ct_v_d] = domainTransform(J, sigma_s, sigma_r, 0);
    
    F = double(I);
    sigma_H = sigma_s;
    for i = 0:(num_iter - 1)
        sigma_Hi = sigma_H * sqrt(3) * 2^(num_iter - (i + 1)) / sqrt(4^num_iter - 1);
        
        F = recursiveFilter(F, ct_h_d, sigma_Hi);
        F = transpose3D(F);
        
        F = recursiveFilter(F, ct_v_d, sigma_Hi);
        F = transpose3D(F);
    end
    
    F = cast(F, class(I));
end

function F = recursiveFilter(I, ct_d, sigma)
    [~, width, channel] = size(I);

    a = exp(-sqrt(2) / sigma);
    V = a .^ ct_d;
    F = I;
    % Left -> Right
    for w = 2:width
        for c = 1:channel
            F(:, w, c) = F(:, w, c) + (F(:, w-1, c) - F(:, w, c)) .* V(:, w);
        end
    end
    % Right -> Left
    for w = width-1:-1:1
        for c = 1:channel
            F(:, w, c) = F(:, w, c) + (F(:, w+1, c) - F(:, w, c)) .* V(:, w+1);
        end
    end
end
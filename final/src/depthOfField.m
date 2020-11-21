function F = depthOfField(I, J, sigma_s, sigma_r, num_iter)
    F = NC(I, J, sigma_s, sigma_r, num_iter);
    for i = 1:3
        I_tmp = I(:, :, i);
        F_tmp = F(:, :, i);
        F_tmp(J > 0.5) = I_tmp(J > 0.5);
        F(:, :, i) = F_tmp;
    end
end
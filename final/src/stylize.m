function F = stylize(I, J, sigma_s, sigma_r, gradient_threshold, num_iter)
    F_NC = NC(I, J, sigma_s, sigma_r, num_iter);
    
    [Gmag, ~] = imgradient(rgb2gray(F_NC));
    Gmag(Gmag > gradient_threshold) = 1;
    
    tmp = rgb2lab(F_NC);
    tmp(:, :, 1) = tmp(:, :, 1) .* (1 - Gmag);
    F = lab2rgb(tmp);
end
function F = colorize(I, S, sigma_s, sigma_r, num_iter)
    N = double(sum(S, 3) ~= 0);
    
    S = RF(S, I, sigma_s, sigma_r, num_iter);
    N = RF(N, I, sigma_s, sigma_r, num_iter);
    C = S ./ repmat(N, 1, 1, 3);
    
    tmp = rgb2lab(C);
    tmp(:, :, 1) = I * 100;
    F = lab2rgb(tmp); 
end
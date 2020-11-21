function F = detailManipulate(I, sigma_s, sigma_r, num_layer, layer_weights)
    [height, width, ~] = size(I);

    I_lab = rgb2lab(I);
    J = I_lab(:, :, 1) / 100;
    
    LM = zeros([height, width]);
    for l = 1:num_layer
        K = IC(J, J, sigma_s * l, sigma_r, 3);
        LM = LM + (J - K) * layer_weights(l);
        J = K;
    end
    LM = LM + J;
    
    tmp = I_lab;
    tmp(:, :, 1) = LM * 100;
    F = lab2rgb(tmp);
end
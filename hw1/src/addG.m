function img_noise = addG(img_original, mean, var)
    noise = sqrt(var) * randn(size(img_original)) + mean;
%     figure('name','gaussian histogram');
%     histogram(noise);
    img_noise = img_original + noise;
end
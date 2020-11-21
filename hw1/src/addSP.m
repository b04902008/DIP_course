function img_noise = addSP(img_original, threshold)
    [X, Y] = size(img_original);
    noise = rand(X, Y);
    img_noise = zeros(X, Y);
    for i=1:X
        for j=1:Y
            if noise(i, j) < threshold
                img_noise(i, j) = 0;
            elseif noise(i, j) > (1 - threshold)
                img_noise(i, j) = 255;
            else
                img_noise(i, j) = img_original(i, j);
            end
        end
    end
end
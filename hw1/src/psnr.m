function diff = psnr(img1, img2)
    [X, Y] = size(img1);
    mse = 0;
    for i=1:X
        for j=1:Y
            mse = mse + (img1(i, j) - img2(i, j)).^2;
        end
    end
    mse = mse / (X * Y);
    diff = 10 * log10(255.^2 / mse);
end
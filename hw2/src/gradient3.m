function img_gradient = gradient3(img_original, threshold)
    filter_row = [0 0 0; -1 1 0; 0 0 0];
    filter_col = [0 0 0; 0 1 0; 0 -1 0];
    img_gradient = sqrt(mask(img_original, filter_row, 1).^2 + mask(img_original, filter_col, 1).^2);
    img_gradient = 255 * (img_gradient > threshold);
end
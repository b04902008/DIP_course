function [img_magnitude, img_orientation] = gradient9(img_original, K)
    filter_row = [-1 0 1; -K 0 K; -1 0 1];
    filter_col = [1 K 1; 0 0 0; -1 -K -1];
    img_row = mask(img_original, filter_row, K + 2);
    img_col = mask(img_original, filter_col, K + 2);
    img_magnitude = sqrt(img_row.^2 + img_col.^2);
    img_orientation = atan(img_col ./ img_row);
end
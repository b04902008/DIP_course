function img_mask = mask(img_original, filter, total)
    [X, Y] = size(img_original);
    img_mask = zeros(X, Y);
    len = (size(filter) - 1) / 2;
    img_pad = padarray(img_original, len, 'symmetric', 'both');
    len = len * 2;
    for i=1:X
        for j=1:Y
            img_mask(i, j) = sum(sum(img_pad(i:i+len(1), j:j+len(2)) .* filter)) / total;
        end
    end
end
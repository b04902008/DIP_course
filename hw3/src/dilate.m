function img_dilation = dilate(img_original, h, origin_coord)
    [x, y] = size(h);
    pre_pad = origin_coord - [1, 1];
    post_pad = [x, y] - origin_coord;
    img_pad = padarray(img_original, pre_pad, 0, 'pre');
    img_pad = padarray(img_pad, post_pad, 0, 'post');
    size_pad = pre_pad + post_pad;
    
    [X, Y] = size(img_original);
    img_dilation = zeros(X, Y);
    for i=1:X
        for j=1:Y
            img_dilation(i, j) = max(max(img_pad(i:i+size_pad(1), j:j+size_pad(2)) .* h));
        end
    end
end
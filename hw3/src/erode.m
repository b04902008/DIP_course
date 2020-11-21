function img_erosion = erode(img_original, h, origin_coord)
    [x, y] = size(h);
    for i=1:x
        for j=1:y
            if h(i, j) == 0
                h(i, j) = inf;
            end
        end
    end
    pre_pad = origin_coord - [1, 1];
    post_pad = [x, y] - origin_coord;
    img_pad = padarray(img_original, pre_pad, 'replicate', 'pre');
    img_pad = padarray(img_pad, post_pad, 'replicate', 'post');
    size_pad = pre_pad + post_pad;
    
    [X, Y] = size(img_original);
    img_erosion = zeros(X, Y);
    for i=1:X
        for j=1:Y
            img_erosion(i, j) = min(min(img_pad(i:i+size_pad(1), j:j+size_pad(2)) .* h));
        end
    end
end
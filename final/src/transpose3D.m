function T = transpose3D(I)
    [height, width, channel] = size(I);
    T = zeros([width, height, channel], class(I));
    for c=1:channel
        T(:, :, c) = I(:, :, c)';
    end
end
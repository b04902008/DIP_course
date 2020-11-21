function img_suppression = suppression(img_magnitude, img_orientation)
    [X, Y] = size(img_magnitude);
    img_suppression = img_magnitude;
    for j=1+1:X-1
        for k=1+1:Y-1
            if img_orientation(j, k) > pi * 3/8
                if img_magnitude(j, k) <= img_magnitude(j+1, k) || img_magnitude(j, k) <= img_magnitude(j-1, k)
                    img_suppression(j, k) = 0;
                end
            elseif img_orientation(j, k) > pi * 1/8
                if img_magnitude(j, k) <= img_magnitude(j+1, k-1) || img_magnitude(j, k) <= img_magnitude(j-1, k+1)
                    img_suppression(j, k) = 0;
                end
            elseif img_orientation(j, k) > pi * (-1)/8
                if img_magnitude(j, k) <= img_magnitude(j, k+1) || img_magnitude(j, k) <= img_magnitude(j, k-1)
                    img_suppression(j, k) = 0;
                end
            elseif img_orientation(j, k) > pi * (-3)/8
                if img_magnitude(j, k) <= img_magnitude(j+1, k+1) || img_magnitude(j, k) <= img_magnitude(j-1, k-1)
                    img_suppression(j, k) = 0;
                end
            else
                if img_magnitude(j, k) <= img_magnitude(j+1, k) || img_magnitude(j, k) <= img_magnitude(j-1, k)
                    img_suppression(j, k) = 0;
                end
            end
        end
    end
end
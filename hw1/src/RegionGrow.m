function [feature, intensity, count] = RegionGrow(img, feature, intensity, count, x, y, threshold)
    [X, Y] = size(img);
    if feature(x, y) == 0
        mean = intensity / count;
        diff = img(x, y) - mean;
        if diff < 0
            diff = -diff;
        end
        if diff < threshold
            intensity = intensity + img(x, y);
            count = count + 1;
            feature(x, y) = 1;
            if x > 1
                [feature, intensity, count] = RegionGrow(img, feature, intensity, count, x-1, y, threshold);
            end
            if y > 1
                [feature, intensity, count] = RegionGrow(img, feature, intensity, count, x, y-1, threshold);
            end
            if x < X
                [feature, intensity, count] = RegionGrow(img, feature, intensity, count, x+1, y, threshold);
            end
            if y < Y
                [feature, intensity, count] = RegionGrow(img, feature, intensity, count, x, y+1, threshold);
            end
        end
    end
end
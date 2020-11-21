function feature = RegionGrow(img, feature, x, y)
    [X, Y] = size(img);
    if feature(x, y) == 0 && img(x, y) == 1
        feature(x, y) = 1;
        if x > 1
            feature = RegionGrow(img, feature, x-1, y);
        end
        if y > 1
            feature = RegionGrow(img, feature, x, y-1);
        end
        if x < X
            feature = RegionGrow(img, feature, x+1, y);
        end
        if y < Y
            feature = RegionGrow(img, feature, x, y+1);
        end
    end
end
function feature = FindFeature(img, xseed, yseed, threshold)
    [X, Y] = size(img);
    feature = zeros(X, Y);
    intensity = 0;
    count = 0;
    for i=-1:1
        for j=-1:1
            count = count + 1;
            intensity = intensity + img(xseed + i, yseed + j);
        end
    end
    [feature, intensity, count] = RegionGrow(img, feature, intensity, count, xseed, yseed, threshold);
end
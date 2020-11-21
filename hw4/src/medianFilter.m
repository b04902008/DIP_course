function img_rmnoise = medianFilter(img_noise, len, percentage)
    [X, Y] = size(img_noise);
    img_rmnoise = zeros(X, Y);
    total = (len * 2 + 1).^2;
    for i=1:X
        for j=1:Y
            outside = 0;
            k = 0;
            filter = [];
            for a=-len:len
                for b=-len:len
                    x = i + a;
                    y = j + b;
                    if x<1 || x>X || y<1 || y>Y
                        outside = outside + 1;
                        continue;
                    end
                    k = k + 1;
                    filter(k) = img_noise(x, y);
                end
            end
            filter = sort(filter);
            if percentage == 50
                img_rmnoise(i, j) = median(filter);
            else
                img_rmnoise(i, j) = filter(fix((total - outside) * percentage / 100));
            end
        end
    end
end
function img_rmnoise = lowpassF(img_noise, filter)
    [X, Y] = size(img_noise);
    img_rmnoise = zeros(X, Y);
    total = sum(sum(filter));
    len = (size(filter, 1) - 1) / 2;
    for i=1:X
        for j=1:Y
            weight = total;
            for a=-len:len
                for b=-len:len
                    x = i + a;
                    y = j + b;
                    if x<1 || x>X || y<1 || y>Y
                        weight  = weight - filter(a+len+1, b+len+1);
                        continue;
                    end
                    img_rmnoise(i, j) = img_rmnoise(i, j) + img_noise(x, y) * filter(a+len+1, b+len+1);
                end
            end
            img_rmnoise(i, j) = img_rmnoise(i, j) / weight;
        end
    end
end
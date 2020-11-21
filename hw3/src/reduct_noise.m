function img_cluster = reduct_noise(img_cluster)
    [X, Y] = size(img_cluster);
    for i=1:X
        for j=1:Y
            if img_cluster(i, j) == 255
                inside = 0;
                for h=1:15
                    if i-h > 0 && i+h < X && img_cluster(i-h, j) == 128 && img_cluster(i+h, j) == 128
                        inside = inside + 1;
                    end
                end
                for h=1:15
                    if j-h > 0 && j+h < Y && img_cluster(i, j-h) == 128 && img_cluster(i, j+h) == 128
                        inside = inside + 1;
                    end
                end
                if inside > 0
                    img_cluster(i, j) = 128;
                end
            end
        end
    end
end
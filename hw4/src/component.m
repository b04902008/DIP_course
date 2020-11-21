function obj_cnt = component(img)
    [X, Y] = size(img);
    i = 1;
    j = 1;
    obj_cnt = 0;
    while i <= X
        if img(i, j) == 1
            img_label = zeros(X, Y);
            img_label = RegionGrow(img, img_label, i, j);
            obj_cnt = obj_cnt + 1;
            img = img - img_label;
        end
        j = j + 1;
        if j > Y
            j = 1;
            i = i + 1;
        end
    end
end
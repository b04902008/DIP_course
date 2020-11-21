img_original = readraw('../raw/sample1.raw');
% figure('name', 'original');imshow(img_original/255);
[X, Y] = size(img_original);

i = 1;
j = 1;
obj_cnt = 0;
while i <= X
    if img_original(i, j) == 255
        img_label = zeros(X, Y);
        img_label(i, j) = 1;
        last_cnt = 0;
        new_cnt = 1;
        while last_cnt ~= new_cnt
            last_cnt = new_cnt;
            img_label = dilate(img_label, [1 1 1; 1 1 1; 1 1 1], [2 2]);
            img_label = img_label & img_original;
            new_cnt = sum(sum(img_label));
        end
        figure('name', 'label');imshow(img_label);
        obj_cnt = obj_cnt + 1;
        img_original = img_original - img_label * 255;
    end
    j = j + 1;
    if j > Y
        j = 1;
        i = i + 1;
    end
end
disp(obj_cnt);
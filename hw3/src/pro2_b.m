img_original = readraw('../raw/sample2.raw');
% figure('name', 'original');imshow(img_original/255);
img_cluster = readraw('../out/K.raw');
% figure('name', 'original');imshow(img_cluster/255);

[X, Y] = size(img_original);
img_new = zeros(X, Y);
for i=1:X
    for j=1:Y
        img_new(i, j) = img_original(mod(i, 64)+64,mod(j, 100)+100);
    end
end
figure('name', 'new');imshow(img_new/255);
imwrite(img_new/255, '../out/I2_ex.bmp');
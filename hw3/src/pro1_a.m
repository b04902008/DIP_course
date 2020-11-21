img_original = readraw('../raw/sample1.raw');
figure('name', 'original');imshow(img_original/255);
imwrite(img_original/255, '../out/I1.bmp');

h = [1 1 1; 1 1 1; 1 1 1];
img_erosion = erode(img_original, h, [2 2]);
img_boundary = img_original - img_erosion;
figure('name', 'boundary');imshow(img_boundary/255);
writeraw(img_boundary, '../out/B.raw');
imwrite(img_boundary/255, '../out/B.bmp');
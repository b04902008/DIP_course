% % % read original
img_original = readraw('../raw/sample4.raw');
% figure('name','img_original');imshow(img_original/255);
imwrite(img_original/255, '../out/I4.bmp');
[X, Y] = size(img_original);

% % % mask wrinkle
img_mask = img_original;
for i=120:170
    for j=40:140
        img_mask(i, j) = 255;
    end
end
% figure('name','img_mask');imshow(img_mask/255);
imwrite(img_mask/255, '../out/I4_mask.bmp');

% % % region growing of eye and eyebrow
feature1 = FindFeature(img_mask, 110, 190, 38);%eye
feature2 = FindFeature(img_mask, 110, 190, 39);%eye
feature3 = FindFeature(img_mask, 80, 180, 10);%eyebrow
feature4 = FindFeature(img_mask, 35, 200, 10);%eyebrow
feature5 = FindFeature(img_mask, 35, 170, 10);%eyebrow
feature6 = FindFeature(img_mask, 42, 148, 12);%eyebrow
feature = feature1 + feature2 + feature3 + feature4 + feature5 + feature6;
img_eyebrow = ones(X, Y) * 255;
for i=1:X
    for j=1:Y
        if feature(i, j) ~= 0
            img_eyebrow(i, j) = img_original(i, j);
        end
    end
end
% figure('name','img_eyebrow');imshow(img_eyebrow/255);
imwrite(img_eyebrow/255, '../out/I4_eyebrow.bmp');

% % % median filter
img_smooth = medianF(img_original, 3, 75);
% figure('name','img_smooth');imshow(img_smooth/255);
imwrite(img_smooth/255, '../out/I4_smooth.bmp');


% % % merge
img_merge = img_smooth;
for i=1:X
    for j=1:Y
        if feature(i, j) ~= 0
            img_merge(i, j) = img_eyebrow(i, j);
        end
    end
end
imwrite(img_merge/255, '../out/I4_merge.bmp');
img_merge = medianF(img_merge, 1, 50);
% figure('name','img_merge');imshow(img_merge/255);
imwrite(img_merge/255, '../out/I4_result.bmp');
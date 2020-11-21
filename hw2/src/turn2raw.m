file_path = '../raw/shape_ori.jpg';
imsize = [512 512];
img_original = cast(imread(file_path), 'double');
img_original = imresize(img_original, imsize);
img_gray = zeros(imsize);
for j=1:imsize(1)
    for k=1:imsize(2)
        img_gray(j, k) = img_original(j, k, 1) * 0.2990 + img_original(j, k, 2) * 0.5870 + img_original(j, k, 3) * 0.11398;
    end
end
file_path = '../raw/shape_ori.raw';
writeraw(img_gray, file_path);
imwrite(img_gray/255, '../out/shape_ori.bmp');
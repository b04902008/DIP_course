img_original = readrawRGB('../raw/sample1.raw');
% figure('name','original');imshow(data_original,[],'InitialMagnification','fit');
% imwrite(data_original, '../out/I1.bmp');

[X,Y,Z] = size(img_original);
imsize = (X * Y * Z) / 3;
N = sqrt(imsize);
img_gray = zeros(N, N);
for i=1:N
    for j=1:N
        img_gray(i, j) = img_original(i, j, 1) * 0.2990 + img_original(i, j, 2) * 0.5870 + img_original(i, j, 3) * 0.11398;
    end
end

% figure('name','gray');imshow(data_gray,[],'InitialMagnification','fit');
% figure('name','gray and flip');imshow(data_gray',[],'InitialMagnification','fit');
writeraw(img_gray', '../out/B.raw');
imwrite(img_gray'/255, '../out/B.bmp');
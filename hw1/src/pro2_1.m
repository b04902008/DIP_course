img_original = readraw('../raw/sample3.raw');
% figure('name','img_original');imshow(img_original,[],'InitialMagnification','fit');
% imwrite(img_original/255, '../out/I3.bmp');
[X, Y] = size(img_original);
imsize = X * Y;
N = sqrt(imsize);

% % % (I)-(a)
img_g1 = addG(img_original, 0, 49);
% figure('name','img_g1');imshow(img_g1,[],'InitialMagnification','fit');
writeraw(img_g1, '../out/G1.raw');
imwrite(img_g1/255, '../out/G1.bmp');
img_g2 = addG(img_original, 0, 225);
% figure('name','img_g2');imshow(img_g2,[],'InitialMagnification','fit');
writeraw(img_g2, '../out/G2.raw');
imwrite(img_g2/255, '../out/G2.bmp');

% % % (I)-(b)
img_sp1 = addSP(img_original, 0.01);
% figure('name','img_sp1');imshow(img_sp1,[],'InitialMagnification','fit');
writeraw(img_sp1, '../out/S1.raw');
imwrite(img_sp1/255, '../out/S1.bmp');
img_sp2 = addSP(img_original, 0.05);
% figure('name','img_sp2');imshow(img_sp2,[],'InitialMagnification','fit');
writeraw(img_sp2, '../out/S2.raw');
imwrite(img_sp2/255, '../out/S2.bmp');

% % % (I)-(c)
img_rmg1 = lowpassF(img_g1, [1 1 1; 1 1 1; 1 1 1]);
% img_rmg1 = medianF(img_g1, 1, 50);
% figure('name','img_rmg1');imshow(img_rmg1,[],'InitialMagnification','fit');
writeraw(img_rmg1, '../out/Rg.raw');
imwrite(img_rmg1/255, '../out/Rg.bmp');
img_rmsp1 = medianF(img_sp1, 1, 50);
% figure('name','img_rmsp1');imshow(img_rmsp1,[],'InitialMagnification','fit');
writeraw(img_rmsp1, '../out/Rs.raw');
imwrite(img_rmsp1/255, '../out/Rs.bmp');

% % % (I)-(d)
psnr_g1 = psnr(img_original, img_rmg1);
psnr_sp1 = psnr(img_original, img_rmsp1);
disp([psnr_g1, psnr_sp1]);
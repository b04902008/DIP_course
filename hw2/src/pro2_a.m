img_original = readraw('../raw/sample3.raw');
% figure('name','original');imshow(img_original/255);
imwrite(img_original/255, '../out/I3.bmp');

%%% (a) crispening
% low-pass
filter = ones(15, 15);
img_lowpass = mask(img_original, filter, sum(sum(filter)));
% figure('name','low pass');imshow(img_lowpass/255);
% combination of all-pass and low-pass
c = 0.6;
img_crispen = c/(2*c-1) * img_original - (1-c)/(2*c-1) * img_lowpass;
% figure('name','crispening');imshow(img_crispen/255);
writeraw(img_crispen, '../out/C.raw');
imwrite(img_crispen/255, '../out/C.bmp');
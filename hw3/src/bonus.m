img_original = readraw('../raw/sample3.raw');
figure('name', 'original');imshow(img_original/255);
imwrite(img_original/255, '../out/I3.bmp');

r = [6 6 6 6];
img_1 = erode(img_original, circle(r(1)), [r(1)+1 r(1)+1]);
img_2 = dilate(img_1, circle(r(2)), [r(2)+1 r(2)+1]);
img_3 = dilate(img_2, circle(r(3)), [r(3)+1 r(3)+1]);
img_result = erode(img_3, circle(r(4)), [r(4)+1 r(4)+1]);
% figure('name', '1');imshow(img_1/255, 'InitialMagnification','fit');
% figure('name', '2');imshow(img_2/255, 'InitialMagnification','fit');
% figure('name', '3');imshow(img_3/255, 'InitialMagnification','fit');
figure('name', 'result');imshow(img_result/255);
writeraw(img_result, '../out/I4.raw');
imwrite(img_result/255, '../out/I4.bmp');
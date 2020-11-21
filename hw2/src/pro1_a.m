img_original = readraw('../raw/sample1.raw');
% figure('name','original');imshow(img_original/255);
imwrite(img_original/255, '../out/I1.bmp');

%%% 1st order
t1 = 35;
% gradient
img_gradient3 = gradient3(img_original, t1);
% figure('name','gradient3');imshow(img_gradient3/255);
imwrite(img_gradient3/255, '../out/1order_3.bmp');
% robert
img_robert = robert(img_original, t1);
% figure('name','robert');imshow(img_robert/255);
imwrite(img_robert/255, '../out/1order_robert.bmp');
% prewitt
[img_prewitt, img_orientation] = gradient9(img_original, 1);
img_prewitt = 255 * (img_prewitt > t1);
% figure('name','prewitt');imshow(img_prewitt/255);
imwrite(img_prewitt/255, '../out/1order_prewitt.bmp');
% sobel
[img_sobel, img_orientation] = gradient9(img_original, 2);
img_sobel = 255 * (img_sobel > t1);
% figure('name','sobel');imshow(img_sobel/255);
imwrite(img_sobel/255, '../out/1order_sobel.bmp');

%%% 2nd order(Laplacian of Gaussian)
% gaussian
filter_gau = [1 4 7 4 1; 4 16 26 16 4; 7 26 41 26 7; 4 16 26 16 4; 1 4 7 4 1];
img_gaussian = mask(img_original, filter_gau, sum(sum(filter_gau)));
% figure('name','gaussian');imshow(img_gaussian/255);
imwrite(img_gaussian/255, '../out/2order_gaussian.bmp');
% laplacian
filter = [0 -1 0; -1 4 -1; 0 -1 0];%[-1 -1 -1; -1 8 -1; -1 -1 -1]%[-2 1 -2; 1 4 1; -2 1 -2]
img_laplacian = mask(img_gaussian, filter, 4);
% figure('name','laplacian');imshow(img_laplacian,[],'InitialMagnification','fit');
% zero-crossing
[img_separate, img_edgemap] = zerocross(img_laplacian, 2, 2.5);
% figure('name','separate');imshow(img_separate/255);
imwrite(img_separate/255, '../out/2order_separate.bmp');
% figure('name','edgemap');imshow(img_edgemap/255);
imwrite(img_edgemap/255, '../out/2order_edge.bmp');

%%% canny
% step1 noise reduction
filter_gau = [2 4 5 4 2; 4 9 12 9 4; 5 12 15 12 5; 4 9 12 9 4; 2 4 5 4 2];
img_gaussian = mask(img_original, filter_gau, sum(sum(filter_gau)));
% figure('name','after gaussian');imshow(img_gaussian/255);
imwrite(img_gaussian/255, '../out/canny_gaussian.bmp');
% step2 gradient
[img_magnitude, img_orientation] = gradient9(img_gaussian, 2);
% figure('name','after sobel');imshow(img_magnitude/255);
imwrite(img_magnitude/255, '../out/canny_magnitude.bmp');
% step3 non-maximal suppression
img_suppression = suppression(img_magnitude, img_orientation);
% figure('name','after suppression');imshow(img_suppression/255);
imwrite(img_suppression/255, '../out/canny_suppression.bmp');
% step4 hysteretic threholding
img_canny = hysteratic(img_suppression, 25, 10);
% figure('name','after hysteratic');imshow(img_canny/255);
imwrite(img_canny/255, '../out/canny_edge.bmp');
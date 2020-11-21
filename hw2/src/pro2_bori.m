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

%%% (b) warping
% shape
img_shape = readraw('../raw/shape.raw');
figure('name','shape');imshow(img_shape/255);
% polynomial warping
pairs          = [1 1; 115 1; 172 20; 230 1; 347 1; 404 20; 461 1; 491 1; ...
    474 38; 512 115; 474 192; 512 269; 474 347; 512 424; 477 485; ...
    404 512; 288 474; 173 512; 57 474; 1 491; ...
    1 462; 20 423; 1 385; 1 307; 20 269; 1 231; 1 153; 20 115; 1 77; ...
    256 256];
original_point = [1 1; 115 1; 172 1; 230 1; 347 1; 404 1; 461 1; 512 1; ...
    512 38; 512 115; 512 192; 512 269; 512 347; 512 424; 512 512; ...
    404 512; 288 512; 173 512; 57 512; 1 512; ...
    1 462; 1 423; 1 385; 1 307; 1 269; 1 231; 1 153; 1 115; 1 77; ...
    256 256]';
% pairs          = [1 1; 50 256; 1 512; 256 450; 512 512; 450 256; 512 1; 256 50];
% original_point = [1 1; 1 256; 1 512; 256 512; 512 512; 512 256; 512 1; 256 1]';
% pairs = [128 128; 128 384; 384 384; 384 128; 256 256; 128 256; 384 256; 256 128; 256 384];
% original_point = [1 1; 1 512; 512 512; 512 1; 256 256; 1 256; 512 256; 256 1; 256 512]';
control_point = [ones(size(pairs, 1), 1) pairs(:, 1) pairs(:, 2) ...
    pairs(:, 1).^2 pairs(:, 2).^2 pairs(:, 2).*pairs(:, 1)]';
coefficient = original_point / control_point;
[X, Y] = size(img_original);
img_warp = ones(X, Y) * 255;
for j=1:X
    for k=1:Y
        if img_shape(j, k) > 128%j>=128 && j<=384 && k>=128 && k<=384
            tmp = cast(coefficient * [1 j k j.^2 k.^2 j*k]', 'int32');
            tmp(tmp < 1) = 1;
            tmp(tmp > 512) = 512;
            img_warp(j, k) = img_crispen(tmp(1), tmp(2));
        end
    end
end
figure('name','warping');imshow(img_warp/255);
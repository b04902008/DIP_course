img_crispen = readraw('../raw/sample1.raw');
figure('name','original');imshow(img_crispen/255);
[X, Y] = size(img_crispen);

% shape edge
% img_shape = readraw('../raw/shape.raw');
img_shape = zeros(512, 512);
for i=128:384
    for j=128:384
        img_shape(i, j) = 255;
    end
end
% step1 noise reduction
filter = [2 4 5 4 2; 4 9 12 9 4; 5 12 15 12 5; 4 9 12 9 4; 2 4 5 4 2];
img_gaussian = mask(img_shape, filter, sum(sum(filter)));
% step2 gradient
[img_magnitude, img_orientation] = gradient9(img_gaussian, 2);
% step3 non-maximal suppression
img_suppression = suppression(img_magnitude, img_orientation);
% step4 hysteretic threholding
img_canny = hysteratic(img_suppression, 25, 10);
figure('name','after hysteratic');imshow(img_canny);

% control point
pairs = [];
for j=1:X
    for k=1:Y
        if img_canny(j, k) == 1
            pairs = [pairs; j k];
        end
    end
end
control_point = [ones(size(pairs, 1), 1) pairs(:, 1) pairs(:, 2) pairs(:, 1).^2 pairs(:, 2).^2 pairs(:, 2).*pairs(:, 1)]';
original_point = [];
control_point = [];
for i=1:size(pairs, 1)
    j = pairs(i, 1);
    k = pairs(i, 2);
    if 100 < j && j < 470 && k < 25
        control_point = [control_point; 1 j k j.^2 k.^2 j*k];
        original_point = [original_point; j 1];
    elseif j < 25 && 70 < k && k < 470
        control_point = [control_point; 1 j k j.^2 k.^2 j*k];
        original_point = [original_point; 1 k];
    elseif j < 400 && k > 470
        control_point = [control_point; 1 j k j.^2 k.^2 j*k];
        original_point = [original_point; j 512];
    elseif j > 470 && k < 425
        control_point = [control_point; 1 j k j.^2 k.^2 j*k];
        original_point = [original_point; 512 k];
    end
end
coefficient = original_point' / control_point';
% warping
[X, Y] = size(img_crispen);
img_warp = ones(X, Y) * 255;
for j=1:X
    for k=1:Y
        if img_shape(j, k) > 128
            tmp = cast(coefficient * [1 j k j.^2 k.^2 j*k]', 'int32');
            if tmp(1) < 1
                tmp(1) = 1;
            elseif tmp(1) > 512
                tmp(1) = 512;
            end
            if tmp(2) < 1
                tmp(2) = 1;
            elseif tmp(2) > 512
                tmp(2) = 512;
            end
            img_warp(j, k) = img_crispen(tmp(1), tmp(2));
        end
    end
end
figure('name','warping');imshow(img_warp/255);
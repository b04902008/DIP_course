img_original = readraw('../out/C.raw');
% figure('name','original');imshow(img_original/255);
[X, Y] = size(img_original);

%%% shape
img_shape = 255 * ones(X, Y);
for j=1:X
    for k=1:Y
        j_min = max(1, 20*sin((k-75)/24.5));
        j_max = min(512, 492+20*sin((k-75)/24.5));
        if j < j_min || j > j_max
            img_shape(j, k) = 0;
        end
        k_min = max(1, 20*sin((j-115)/37));
        k_max = min(512, 492 + 20*sin((j-118)/36));
        if k < k_min || k > k_max
            img_shape(j, k) = 0;
        end
    end
end
% figure('name','shape');imshow(img_shape/255);
imwrite(img_shape/255, '../out/shape.bmp');

%%% (b) warping
img_warp = 255 * ones(X, Y);
for j=1:X
    for k=1:Y
        j_min = max(1, 20*sin((k-75)/24.5));
        j_max = min(512, 492+20*sin((k-75)/24.5));
        ori_j = ceil(512 * (j-j_min) / (j_max-j_min));
        if ori_j < 1 || ori_j > X
            img_warp(j, k) = 0;
            continue;
        end
        k_min = max(1, 20*sin((j-115)/37));
        k_max = min(512, 492 + 20*sin((j-118)/36));
        ori_k = ceil(512 * (k-k_min) / (k_max-k_min));
        if ori_k < 1 || ori_k > 512
            img_warp(j, k) = 0;
            continue;
        end
        img_warp(j, k) = img_original(ori_j, ori_k);
    end
end
% figure('name','warp');imshow(img_warp/255);
writeraw(img_warp, '../out/D.raw');
imwrite(img_warp/255, '../out/D.bmp');
img_original = readraw('../raw/sample2.raw');
figure('name', 'original');imshow(img_original/255);
imwrite(img_original/255, '../out/I2.bmp');

% laws' Method
disp('laws Method...');
[img_texture1, img_texture2, img_texture3, img_texture4, img_texture5, ...
img_texture6, img_texture7, img_texture8, img_texture9] = lawsMethod(img_original);
img_texture = cat(3, img_texture1, img_texture2, img_texture3, img_texture4, ...
    img_texture5, img_texture6, img_texture7, img_texture8, img_texture9);
% figure('name', 'texture1');imshow(img_texture1, []);
% figure('name', 'texture2');imshow(img_texture2, []);
% figure('name', 'texture3');imshow(img_texture3, []);
% figure('name', 'texture4');imshow(img_texture4, []);
% figure('name', 'texture5');imshow(img_texture5, []);
% figure('name', 'texture6');imshow(img_texture6, []);
% figure('name', 'texture7');imshow(img_texture7, []);
% figure('name', 'texture8');imshow(img_texture8, []);
% figure('name', 'texture9');imshow(img_texture9, []);

% K-means
disp('K-means...');
K = 3;
last_centroid = zeros(K, 9);
new_centroid = zeros(K, 9);
new_centroid(1, :) = reshape(img_texture(128, 128, :), 1, 9);
new_centroid(2, :) = reshape(img_texture(128, 384, :), 1, 9);
new_centroid(3, :) = reshape(img_texture(384, 384, :), 1, 9);
[X, Y] = size(img_original);
last_cluster = zeros(X, Y);
new_cluster = ones(X, Y);
diff = sum(sum(new_cluster ~= last_cluster));
while diff ~= 0
    last_centroid = new_centroid;
    last_cluster = new_cluster;
    % step 1
    for i=1:X
        for j=1:Y
            min_dist = norm(last_centroid(1, :) - reshape(img_texture(i, j, :), 1, 9));
            min_index = 1;
            for k=2:K
                dist = norm(last_centroid(k, :) - reshape(img_texture(i, j, :), 1, 9));
                if dist < min_dist
                    min_dist = dist;
                    min_index = k;
                end
            end
            new_cluster(i, j) = min_index;
        end
    end
    % step 2
    for c=1:3
        new_centroid(c, :) = zeros(1, 9);
        cnt = 0;
        for i=1:X
            for j=1:Y
                if new_cluster(i, j) == c
                    new_centroid(c, :) = new_centroid(c, :) + reshape(img_texture(i, j, :), 1, 9);
                    cnt = cnt + 1;
                end
            end
        end
        new_centroid(c, :) = new_centroid(c, :) / cnt;
    end
    % cluster
    img_cluster = zeros(X, Y);
    for i=1:X
        for j=1:Y
            if new_cluster(i, j) == 1
                img_cluster(i, j) = 0;
            elseif new_cluster(i, j) == 2
                img_cluster(i, j) = 128;
            elseif new_cluster(i, j) == 3
                img_cluster(i, j) = 255;
            end
        end
    end
    diff = sum(sum(new_cluster ~= last_cluster));
end
imwrite(img_cluster/255, '../out/K_before.bmp');

% reduct noise
disp('reduct noise...');
img_cluster = reduct_noise(img_cluster);
img_cluster = reduct_noise(img_cluster);
figure('name', 'cluster');imshow(img_cluster/255);
writeraw(img_cluster, '../out/K.raw');
imwrite(img_cluster/255, '../out/K.bmp');
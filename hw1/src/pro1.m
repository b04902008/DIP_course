img_original = readraw('../raw/sample2.raw');
% figure('name','original');imshow(img_original,[],'InitialMagnification','fit');
% imwrite(img_original/255, '../out/I2.bmp');

% (a)
[X,Y] = size(img_original);
imsize = X * Y;
N = sqrt(imsize);
img_dark = zeros(N, N);
for i=1:N
    for j=1:N
        img_dark(i, j) = fix(img_original(i, j) / 3);
    end
end
% figure('name','dark');imshow(img_dark,[],'InitialMagnification','fit');
writeraw(img_dark, '../out/D.raw');
imwrite(img_dark/255, '../out/D.bmp');

% (b)
figure('name','original histogram');histogram(img_original, 0:1:255);
figure('name','dark histogram');histogram(img_dark, 0:1:255);

% (c)
img_he = zeros(N, N);
trans = zeros(256);
for i=1:N
    for j=1:N
        tmp = img_dark(i, j)+1;
        trans(tmp) = trans(tmp) + 1;
    end
end
for i=2:256
    trans(i) = trans(i) + trans(i-1);
end
trans = floor(trans * 255 / (N * N));
for i=1:N
    for j=1:N
        img_he(i, j) = trans(img_dark(i, j)+1);
    end
end
% figure('name','he');imshow(img_he,[],'InitialMagnification','fit');
writeraw(img_he, '../out/H.raw');
imwrite(img_he/255, '../out/H.bmp');

%(d)
img_lhe = zeros(N, N);
len = 5;
region = (2 * len + 1) * (2 * len + 1) - 1;
for i=1:N
    for j=1:N
        outside = 0;
        rank = 0;
        for a=-len:len
            for b=-len:len
                if a==0 && b==0
                    continue
                end
                x = i + a;
                y = j + b;
                if x<1 || x>N || y<1 || y>N
                    outside = outside + 1;
                    continue;
                end
                if img_dark(i, j) > img_dark(x, y)
                    rank = rank + 1;
                end
            end
        end
        img_lhe(i, j) = rank * 255 / (region - outside);
    end
end
% figure('name','lhe');imshow(img_lhe,[],'InitialMagnification','fit');
writeraw(img_lhe, '../out/L.raw');
imwrite(img_lhe/255, '../out/L.bmp');

% (e)
figure('name','histogram equalization histogram');histogram(img_he, 0:1:255);
figure('name','local histogram equalization histogram');histogram(img_lhe, 0:1:255);
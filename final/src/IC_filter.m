%%% detailManipulate sample1
I = im2double(imread('input/beach.jpg'));
F = detailManipulate(I, 10, 0.15, 1, [3.5]);
figure('name', 'detail manipulation');
subplot(1, 2, 1), imshow(I), title('Input');
subplot(1, 2, 2), imshow(F), title('Output');
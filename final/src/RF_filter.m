%%% colorize sample1
I = rgb2gray(im2double(imread('input/mcdonald.jpg')));
S1 = im2double(imread('input/mcdonald_scribble1.png'));
F1 = colorize(I, S1, 300, 0.2, 5);
figure('name', 'colorization');
subplot(1, 3, 1), imshow(I), title('Input');
subplot(1, 3, 2), imshow(S1), title('Scribble');
subplot(1, 3, 3), imshow(F1), title('Output');

%%% colorize sample2
S2 = im2double(imread('input/mcdonald_scribble2.png'));
F2 = colorize(I, S2, 300, 0.2, 5);
figure('name', 'colorization');
subplot(1, 3, 1), imshow(I), title('Input');
subplot(1, 3, 2), imshow(S2), title('Scribble');
subplot(1, 3, 3), imshow(F2), title('Output');

%%% recolor sample1
I = im2double(imread('input/magicblock.jpg'));
S1 = im2double(imread('input/magicblock_scribble1.png'));
color1 = [1 0 0; 0 1 0; 0 0 1]';
F1 = recolor(I, S1, color1, 200, 0.3, 3);
figure('name', 'recoloring');
subplot(1, 3, 1), imshow(I), title('Input');
subplot(1, 3, 2), imshow(S1), title('Scribble');
subplot(1, 3, 3), imshow(F1), title('Output');

%%% recolor sample2
I = im2double(imread('input/magicblock.jpg'));
S2 = im2double(imread('input/magicblock_scribble2.png'));
color2 = [1 0 0; 0 1 0; 0 0 1; 1 1 0; 1 0 1; 0 1 1]';
F2 = recolor(I, S2, color2, 200, 0.3, 3);
figure('name', 'recoloring');
subplot(1, 3, 1), imshow(I), title('Input');
subplot(1, 3, 2), imshow(S2), title('Scribble');
subplot(1, 3, 3), imshow(F2), title('Output');
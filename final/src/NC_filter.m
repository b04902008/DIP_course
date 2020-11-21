%%% stylize sample1(with canny edge and voronoi diagram)
I = im2double(imread('input/depart.jpg'));
J = im2double(edge(rgb2gray(I), 'Canny', 0.04, 5));
F = stylize(I, J, 30, 1, 0.3, 3);
figure('name', 'stylization');
subplot(1, 2, 1), imshow(I), title('Input');
subplot(1, 2, 2), imshow(F), title('Output');

%%% stylize sample2(with voronoi diagram)
I = im2double(imread('input/lamp.jpg'));
voronoi_image = voronoiImage(150, size(I, 1), size(I, 2));
voronoi_image = imdilate(voronoi_image, [0 0 0; 0 1 1; 0 0 0]);
canny_edge = im2double(edge(rgb2gray(I), 'Canny', 0.2, 5));
J = voronoi_image + canny_edge;
J(J > 1) = 1;
F = stylize(I, J, 30, 0.2, 0.5, 3);
figure('name', 'stylization');
subplot(1, 2, 1), imshow(I), title('Input');
subplot(1, 2, 2), imshow(F), title('Output');

%%% pencilDraw sample1
I = im2double(imread('input/lena.png'));
F = pencilDraw(I, 60, 0.08, 0.15, 3);
figure('name', 'pencile drawing');
subplot(1, 2, 1), imshow(I), title('Input');
subplot(1, 2, 2), imshow(F), title('Output');

%%% depthOfField sample1
I = im2double(imread('input/pencils.jpg'));
J = im2double(imread('input/pencils_joint_depth.jpg'));
F = depthOfField(I, J, 30, 0.2, 3);
figure('name', 'depth of field');
subplot(1, 2, 1), imshow(I), title('Input');
subplot(1, 2, 2), imshow(F), title('Output');
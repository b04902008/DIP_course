% DIP Homework Assignment #3
% May 2, 2018
% Name: Melody Tseng
% ID #: B04902008
% email: b04902008@csie.ntu.edu.tw

%###############################################################################%
% PROBLEM 1: Morphological Processing
% Implementation (a): boundary extraction
% Implementation (b): count the objects
% Implementation (c): skeletonizing
% M-file name: pro1_a.m(& erode.m), pro1_b.m(& dilate.m), pro1_c.m
% Usage: pro1_a, pro1_b, pro1_c
% Input Image: ../raw/sample1.raw
% Output Image: ../out/I1.bmp, ../out/B.raw, ../out/B.bmp, ../out/S.raw, ../out/S.bmp
% Plot Window: each object in I1 and output image mentioned above
%###############################################################################%
disp('Running "pro1_a" ...');
pro1_a;
disp('Done pro1_a, output images are I1.bmp, B.raw and B.bmp');
disp('Running "pro1_b" ...');
pro1_b;
disp('Done pro1_b, it is the number of objects');
disp('Running "pro1_c" ...');
pro1_c;
disp('Done pro1_c, output images are S.raw and S.bmp');
%###############################################################################%
% PROBLEM 2: Texture Analysis
% Implementation (a): Law¡¦s method
% Implementation (b): exchange the types of different texture patterns
% M-file name: pro2_a.m(& lawsMethod.m & mask.m & reduct_noise.m), pro2_b.m
% Usage: pro2_a, pro2_b
% Input image: ../raw/sample2.raw, ../out/K.raw
% Output image: ../out/I2.bmp, ../out/K.raw, ../out/K.bmp, ../out/I2_ex.bmp
%###############################################################################%
disp('Running "pro2_a" ...');
pro2_a;
disp('Done pro2_a, output images are I2.bmp, K.raw and K.bmp');
disp('Running "pro2_b" ...');
pro2_b;
disp('Done pro2_b, output images are I2_ex.bmp');
%###############################################################################%
% Bonus
% Implementation : opening and closing
% M-file name: bonus.m(& circle.m)
% Usage: bonus
% Input image: ../raw/sample3.raw
% Output image: ../out/I3.bmp, ../out/I4.raw, ../out/I4.bmp
% Plot Window: output image mentioned above
%###############################################################################%
disp('Running "bonus" ...');
bonus;
disp('Done bonus, output images are I3.bmp, I4.raw and I4.bmp');
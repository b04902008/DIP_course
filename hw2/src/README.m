% DIP Homework Assignment #2
% April 11, 2018

%###############################################################################%
% PROBLEM 1: EDGE DETECTION
% Implementation (a): edge detection
%   - Function M-file name: mask.m, gradient3.m, robert.m, gradient9.m
%   - Function M-file name: zerocross.m
%   - Function M-file name: suppression.m, hysteratic.m
%
% M-file name: pro1_a.m
% Usage: pro1_a
% Input Image: ../raw/sample1.raw
%###############################################################################%
disp('Running "pro1_a" ...');
pro1_a;
disp('Done pro1_a, output images about 1st order, 2nd order and canny image on report');

%###############################################################################%
% PROBLEM 2: NOISE REMOVAL
% Implementation (a): edge crispening
% Implementation (b): warping
%
% M-file name: pro2_a.m, pro2_b.m
% Usage: pro2_a, pro2_b
% Input image: ../raw/sample3.raw, ../out/C.raw
% Output image: ../out/I3.bmp, ../out/C.raw, ../out/C.bmp
%               ../out/shape.bmp, ../out/D.raw, ../out/D.bmp
%###############################################################################%
disp('Running "pro2_a" ...');
pro2_a;
disp('Done pro2_a, output images are raw file and bmp file of C and I3.bmp');
disp('Running "pro2_b" ...');
pro2_b;
disp('Done pro2_b, output images are raw file and bmp file of D and shape.bmp');
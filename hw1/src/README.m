% DIP Homework Assignment #1
% March 28, 2018

%###############################################################################%
% WARM-UP: SIMPLE MANIPULATIONS
% M-file name: warmup.m
% Usage: warmup
% Input image: ../raw/sample1.raw
% Output image: ../out/B.raw, ../out/B.bmp
%###############################################################################%
disp('Running "warmup" ...');
warmup;
disp('Done, "warmup", output image is "B.raw" and "B.bmp"');

%###############################################################################%
% PROBLEM 1: IMAGE ENHANCEMENT
% Implementation (a): brightness decreasing (by dividing the intensity values by 3)
% Implementation (b): histogram plotting (I2, D)
% Implementation (c): histogram equalization (transfer function)
% Implementation (d): local histogram equalization
% Implementation (e): histogram plotting (H, L)
%
% M-file name: pro1.m
% Usage: pro1
% Input Image: ../raw/sample2.raw
% Output Image: ../out/D.raw, ../out/D.bmp, ../out/H.raw, ../out/H.bmp, ../out/L.raw, ../out/L.bmp
% Plot Window: histogram of I2, D, H, L
%###############################################################################%
disp('Running "pro1" ...');
pro1;
disp('Done, "pro1", output images are "D.raw", "D.bmp", "H.raw", "H.bmp", "L.raw", "L.bmp"');

%###############################################################################%
% PROBLEM 2: NOISE REMOVAL
% Implementation (I-a): Gaussian noise adding
%   - Function M-file name: addG.m
% Implementation (I-b): salt-and-pepper noise adding
%   - Function M-file name: addSP.m
% Implementation (I-c): noise removal (low-pass/median filter)
%   - Function M-file name: lowpassF.m/ medianF.m
% Implementation (I-d): PSNR calculating
%   - Function M-file name: psnr.m
% Implementation (II): wrinkles removal
%   - Function M-file name: FindFeature.m, RegionGrow.m
%
% M-file name: pro2_1.m, pro2_2.m
% Usage: pro2_1, pro2_2
% Input image: ../raw/sample3.raw, ../raw/sample4.raw
% Output image: ../out/G1.raw, ../out/G2.raw, ../out/S1.raw, ../out/S2.raw, ../out/Rg.raw, ../out/Rs.raw
%               ../out/G1.bmp, ../out/G2.bmp, ../out/S1.bmp, ../out/S2.bmp, ../out/Rg.bmp, ../out/Rs.bmp
%               ../out/I4_mask.bmp, ../out/I4_eyebrow.bmp, ../out/I4_smooth.bmp, ../out/I4_merge.bmp, ../out/I4_result.bmp
%###############################################################################%
disp('Running "pro2-1" ...');
pro2_1;
disp('Done, "pro2-1", output images are raw file and bmp file of G1, G2, S1, S2, Rg, Rs');
pro2_2;
disp('Done, "pro2-2", output images are "I4_mask.bmp", "I4_eyebrow.bmp", "I4_smooth.bmp", "I4_merge.bmp", "I4_result.bmp", ');
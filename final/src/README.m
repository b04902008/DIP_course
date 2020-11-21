% DIP Final Project
% June 27, 2018
% Name: Melody Tseng, Alex Chang
% ID #: B04902008, B04902011
% Email: b04902008@csie.ntu.edu.tw, b04902011@csie.ntu.edu.tw
% Total time: about 2 minutes
% Common M-file name: domainTransform.m, transpose3D.m

%###############################################################################%
% Normalized Convolution(NC)
% M-file name: NC.m, stylize.m, voronoiImage.m, pencilDraw.m, depthOfField.m
% Usage: NC_filter
% Flter: stylization, pencil drawing, depth-of-field
% Input image: input/depart.jpg, input/lamp.jpg, input/lena.png, input/pencils.jpg, input/pencils_joint_depth.jpg
%###############################################################################%
NC_filter;
%###############################################################################%
% Interpolated Convolution(IC)
% M-file name: IC.m, detailManipulate.m
% Usage: IC_filter
% Filter: detail manipulation
% Input image: input/beach.jpg
%###############################################################################%
IC_filter;
%###############################################################################%
% Recursive Filtering(RF)
% M-file name: RF.m, colorize.m, recolor.m
% Usage: RF_filter
% Filter: colorization, recoloring
% Input image: input/mcdonald.jpg, input/mcdonald_scribble1.png, input/mcdonald_scribble2.png,
% input/magicblock.jpg, input/magicblock_scribble1.png, input/magicblock_scribble2.png
%###############################################################################%
RF_filter;
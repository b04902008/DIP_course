% DIP Final Project
% June 27, 2018
% Total time: about 2 minutes
% Common M-file name: domainTransform.m, transpose3D.m

%###############################################################################%
% Normalized Convolution(NC)
% Implementation of Filter: stylization, pencil drawing, depth-of-field
%   - Function M-file name: NC.m, stylize.m, voronoiImage.m, pencilDraw.m, depthOfField.m
%
% M-file name: NC_filter.m
% Usage: NC_filter
% Input image: input/depart.jpg, input/lamp.jpg, input/lena.png,
%              input/pencils.jpg, input/pencils_joint_depth.jpg
%###############################################################################%
NC_filter;

%###############################################################################%
% Interpolated Convolution(IC)
% Implementation of Filter: detail manipulation
%   - Function M-file name: IC.m, detailManipulate.m
%
% M-file name: IC_filter.m
% Usage: IC_filter
% Input image: input/beach.jpg
%###############################################################################%
IC_filter;

%###############################################################################%
% Recursive Filtering(RF)
% Implementation of Filter: colorization, recoloring
%   - Function M-file name: RF.m, colorize.m, recolor.m
%
% M-file name: RF_filter.m
% Usage: RF_filter
% Input image: input/mcdonald.jpg, input/magicblock.jpg,
%              input/mcdonald_scribble1.png, input/mcdonald_scribble2.png,
%              input/magicblock_scribble1.png, input/magicblock_scribble2.png
%###############################################################################%
RF_filter;
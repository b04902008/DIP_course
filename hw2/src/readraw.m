function G=readraw(filename)
% readraw - read RAW format grey scale image file from Disk
% Usuage - G=readraw(filename)
% G: image data matrix
% filename: file name of the file to read from disk

    % disp(['Retrieving Image ' filename]);
	fid = fopen(filename, 'rb');
    if (fid == -1)
        error('can not open imput image filem press CTRL-C to exit \n');
        pause
    end
	pixel = fread(fid, inf, 'uchar');
	fclose(fid);

    [Y, X] = size(pixel);
    imsize = Y * X;
    N = sqrt(imsize);
    G = zeros(N, N);
    G(1: imsize) = pixel(1: imsize);
    G = permute(G, [2,1]);
end
function count=writerawRGB(G, filename)
% writeraw - write RAW format rgb color image file to Disk
% Usuage - count=writerawRGB(G, filename)
% G: image data matrix
% filename: file name of the file to write to disk
% count: return value, the elements written to file

	disp(['Write image data to'  filename '...']);
	fid = fopen(filename, 'wb');
	if (fid == -1)
    	error('can not open output image filem press CTRL-C to exit \n');
    	pause
 	end
	G = permute(G, [2,1,3]);
	count = fwrite(fid, G, 'uchar');
	fclose(fid);
end
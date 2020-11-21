function [img_separate, img_edgemap] = zerocross(img_laplacian, threshold_zero, threshold_cross)
    [X,Y] = size(img_laplacian);
    % step1
%     disp([max(max(img_laplacian)), min(min(img_laplacian))]);
%     histogram(img_laplacian, -75:1:70);
    % step2
    img_separate = 255 * (((img_laplacian > threshold_zero) + (img_laplacian < -threshold_zero)) == 0);
    % step3
    img_edgemap = zeros(X, Y);
    for i=1:X
        for j=1:Y
            if img_separate(i, j) == 255
                if i ~= 1 && img_laplacian(i, j) * img_laplacian(i-1, j) < 0 ...
                    && abs(img_laplacian(i, j) - img_laplacian(i-1, j)) > threshold_cross
                    img_edgemap(i, j) = 255;
                elseif i ~= X && img_laplacian(i, j) * img_laplacian(i+1, j) < 0 ...
                        && abs(img_laplacian(i, j) - img_laplacian(i+1, j)) > threshold_cross
                    img_edgemap(i, j) = 255;
                elseif j ~= 1 && img_laplacian(i, j) * img_laplacian(i, j-1) < 0 ...
                        && abs(img_laplacian(i, j) - img_laplacian(i, j-1)) > threshold_cross
                    img_edgemap(i, j) = 255;
                elseif j ~= Y && img_laplacian(i, j) * img_laplacian(i, j+1) < 0 ...
                        && abs(img_laplacian(i, j) - img_laplacian(i, j+1)) > threshold_cross
                    img_edgemap(i, j) = 255;
                end
            end
        end
    end
end
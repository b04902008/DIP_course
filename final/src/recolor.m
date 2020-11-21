function F = recolor(I, S, color, sigma_s, sigma_r, num_iter)
    I_gray = rgb2gray(I);
    [height, width] = size(I_gray);
    % N
    N0 = zeros([height, width]);% white
    color_num = size(color, 2);% other color
    for c=1:color_num
        eval(sprintf('N%d = zeros([height, width]);', c));
    end
    for h=1:height
        for w=1:width
            tmp = S(h, w, :);
            tmp = tmp(:);
            if isequal(tmp, [1;1;1])
                N0(h, w) = 1;
            else
                for c=1:color_num
                    if isequal(tmp, color(:, c))
                        eval(sprintf('N%d(%d, %d) = 1;', c, h, w));
                    end
                end
            end
        end
    end
    N_RF = zeros([height, width]);
    for c=0:color_num
        eval(sprintf('N%d_RF = RF(N%d, I_gray, sigma_s, sigma_r, num_iter);', c, c));
        eval(sprintf('N_RF = N_RF + N%d_RF;', c));
    end
    % S
    for c=0:color_num
        eval(sprintf('S%d = S .* repmat(N%d, 1, 1, 3);', c, c));
        eval(sprintf('S%d_RF = RF(S%d, I_gray, sigma_s, sigma_r, num_iter);', c, c));
        eval(sprintf('F%d = S%d_RF ./ repmat(N%d_RF, 1, 1, 3);', c, c,c));
    end
    F0 = I;
    % combine
    F = zeros(size(I));
    for c=0:color_num
        eval(sprintf('F = F + F%d .* (N%d_RF ./ N_RF);', c, c));
    end
    tmp = rgb2lab(F);
    tmp(:, :, 1) = I_gray * 100;
    F = lab2rgb(tmp);
end
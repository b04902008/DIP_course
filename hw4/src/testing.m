function testing(img_train, train_num, train_up, train_down, train_left, train_right, ...
                 X, Y, test_filename, median)
    % read file
    img_test = readraw(test_filename, X, Y);
    figure('name', 'test1');imshow(img_test/255);
    if median
        img_test = medianFilter(img_test, 1, 50);
        figure('name', 'test1');imshow(img_test/255);
    end
    img_test = (img_test < 127);
    figure('name', 'test1');imshow(img_test);
    fprintf('%s: ', test_filename);
    % find rough bound
    [row_num, row_start, row_end] = divide(img_test, 2);
    [col_num, col_start, col_end] = divide(img_test, 1);
    % find precise bound
    [test_num, test_up, test_down, test_left, test_right] = bound(img_test, ...
                                                        row_num, row_start, row_end, ...
                                                        col_num, col_start, col_end);
    % find word
    word = ['A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' 'I' 'J' ...
            'K' 'L' 'M' 'N' 'O' 'P' 'Q' 'R' 'S' 'T' ...
            'U' 'V' 'W' 'X' 'Y' 'Z' 'a' 'b' 'c' 'd' ...
            'e' 'f' 'g' 'h' 'i' 'j' 'k' 'l' 'm' 'n' ...
            'o' 'p' 'q' 'r' 's' 't' 'u' 'v' 'w' 'x' ...
            'y' 'z' '0' '1' '2' '3' '4' '5' '6' '7' ...
            '8' '9' '!' '@' '#' '$' '%' '^' '&' '*'];
    ans = [];
    for a=1:test_num
        test_h = test_down(a) - test_up(a) + 1;
        test_w = test_right(a) - test_left(a) + 1;
        part_img_test = img_test(test_up(a):test_down(a), test_left(a):test_right(a));
        test_obj = component(part_img_test);
        max_percentage = 0;
        for b=1:train_num
            train_h = train_down(b) - train_up(b) + 1;
            train_w = train_right(b) - train_left(b) + 1;
            part_img_train = img_train(train_up(b):train_down(b), train_left(b):train_right(b));
            train_obj = component(part_img_train);
            if test_obj == train_obj
                resized_img_test = zeros(train_h, train_w);
                for i=1:train_h
                    for j=1:train_w
                        ori_i = floor((test_h-1) * (i-1) / (train_h-1) + 1);%ceil(test_h * i / train_h);
                        ori_j = floor((test_w-1) * (j-1) / (train_w-1) + 1);%ceil(test_w * j / train_w);
                        resized_img_test(i, j) = part_img_test(ori_i, ori_j);
                    end
                end
                common_part = resized_img_test & part_img_train;
                percentage = sum(sum(common_part))/sum(sum(resized_img_test)) + sum(sum(common_part))/sum(sum(part_img_train));
                if percentage > max_percentage
                    ans(a) = b;
                    max_percentage = percentage;
                end
            end
        end
    end
    disp(word(ans));
end
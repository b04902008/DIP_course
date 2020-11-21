function [total_num, up, down, left, right] = bound(img, row_num, row_start, row_end, col_num, col_start, col_end)
    total_num = row_num * col_num;
    up = []; down = []; left = []; right = [];
    for m=1:row_num
        for n=1:col_num
            order = (m-1)*col_num+n;
            x = row_start(m):row_end(m);
            y = col_start(n):col_end(n);
            part_img = img(x, y);
            part_row_sum = sum(part_img, 2) > 0;
            for i=1:size(x, 2)
                if part_row_sum(i) == 1
                    up(order) = i + row_start(m) - 1;
                    break;
                end
            end
            for i=size(x, 2):-1:1
                if part_row_sum(i) == 1
                    down(order) = i + row_start(m) - 1;
                    break;
                end
            end
            part_col_sum = sum(part_img, 1) > 0;
            for j=1:size(y, 2)
                if part_col_sum(j) == 1
                    left(order) = j + col_start(n) - 1;
                    break;
                end
            end
            for j=size(y, 2):-1:1
                if part_col_sum(j) == 1
                    right(order) = j + col_start(n) - 1;
                    break;
                end
            end
        end
    end
end
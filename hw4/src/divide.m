function [block_num, block_start, block_end] = divide(img, dimension)
    block_sum = sum(img, dimension) > 0;
    block_start = [];
    block_end = [];
    block_num = 0;
    find = 1;
    for j=1:size(img, 3-dimension)
        if block_sum(j) == find
            if find == 1
                block_num = block_num + 1;
                block_start(block_num) = j;
            elseif find == 0
                block_end(block_num) = j - 1;
            end
            find = 1 - find;
        end
    end
end
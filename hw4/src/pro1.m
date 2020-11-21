% img_train
X = 248; Y = 450;
img_train = readraw('../raw/TrainingSet.raw', X, Y);
figure('name', 'train');imshow(img_train/255);
img_train = (img_train < 200);
% for i=119:121
%     for j=206:210
%         img_train(i, j) = 0;
%     end
% end
figure('name', 'train');imshow(img_train);
fprintf('trainingSet is ../raw/TrainingSet.raw\n');
% find rough bound
[row_num, row_start, row_end] = divide(img_train, 2);
[col_num, col_start, col_end] = divide(img_train, 1);
% find precise bound
[train_num, train_up, train_down, train_left, train_right] = bound(img_train, ...
                                                        row_num, row_start, row_end, ...
                                                        col_num, col_start, col_end);
% img_test1
testing(img_train, train_num, train_up, train_down, train_left, train_right, ...
        125, 390, '../raw/sample1.raw', 0);
% img_test2
testing(img_train, train_num, train_up, train_down, train_left, train_right, ...
        125, 390, '../raw/sample2.raw', 1);
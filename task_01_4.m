# Set the number of neighbours that participate during the classification of the
# test image.
k = 10;

# Set the number of train images that should be used to classify each of the
# test images (max 60'000).
train_size = 10000;

# Set the number of test images that should be classified (max 10'000).
test_size = 1000;

# Specify whether the result of each image classification should be printed or not.
show_log = 0;

k_nearest_neighbours(k, train_size, test_size, show_log);

clear;

% Best Result:
% Train images: 10000 | Test Images: 100 | k: 10 | Error Rate: 13%

% All Results:
% Train images: 100 | Test Images: 100 | k: 1 | Error Rate: 35%
% Train images: 100 | Test Images: 100 | k: 2 | Error Rate: 48%
% Train images: 100 | Test Images: 100 | k: 5 | Error Rate: 46%
% Train images: 100 | Test Images: 100 | k: 10 | Error Rate: 56%
% Train images: 100 | Test Images: 100 | k: 50 | Error Rate: 79%
% Train images: 100 | Test Images: 100 | k: 100 | Error Rate: 86%

% Train images: 1000 | Test Images: 100 | k: 1 | Error Rate: 40%
% Train images: 1000 | Test Images: 100 | k: 2 | Error Rate: 30%
% Train images: 1000 | Test Images: 100 | k: 5 | Error Rate: 24%
% Train images: 1000 | Test Images: 100 | k: 10 | Error Rate: 20%
% Train images: 1000 | Test Images: 100 | k: 50 | Error Rate: 27%
% Train images: 1000 | Test Images: 100 | k: 100 | Error Rate: 36%

% Train images: 1000 | Test Images: 1000 | k: 1 | Error Rate: 39.1%
% Train images: 1000 | Test Images: 1000 | k: 2 | Error Rate: 29.2%
% Train images: 1000 | Test Images: 1000 | k: 5 | Error Rate: 21.9%
% Train images: 1000 | Test Images: 1000 | k: 10 | Error Rate: 21.7%
% Train images: 1000 | Test Images: 1000 | k: 50 | Error Rate: 27.3%
% Train images: 1000 | Test Images: 1000 | k: 100 | Error Rate: 33.3%

% Train images: 10000 | Test Images: 100 | k: 1 | Error Rate: 19%
% Train images: 10000 | Test Images: 100 | k: 2 | Error Rate: 19%
% Train images: 10000 | Test Images: 100 | k: 5 | Error Rate: 16%
% Train images: 10000 | Test Images: 100 | k: 10 | Error Rate: 13%
% Train images: 10000 | Test Images: 100 | k: 50 | Error Rate: 16%
% Train images: 10000 | Test Images: 100 | k: 100 | Error Rate: 19%

% Train images: 10000 | Test Images: 1000 | k: 1 | Error Rate: 30.9%
% Train images: 10000 | Test Images: 1000 | k: 2 | Error Rate: 21.8%
% Train images: 10000 | Test Images: 1000 | k: 5 | Error Rate: 21.5%
% Train images: 10000 | Test Images: 1000 | k: 100 | Error Rate: 22.2%

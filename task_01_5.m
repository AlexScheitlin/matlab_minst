# Set the number of neighbours that participate during the classification of the
# test image.
k = 5;

# Set the number of train images that should be used to classify each of the
# test images (max 60'000).
train_size = 1000;

# Set the number of test images that should be classified (max 10'000).
test_size = 100;

# Specify whether the result of each image classification should be printed or not.
show_log = 0;

k_nearest_neighbours_blur(k, train_size, test_size, show_log);

clear;

% Train images: 1000 | Test Images: 100 | k: 10 | Error Rate: 16%

% All Results:
% Train images: 100 | Test Images: 100 | k: 1 | Error Rate: 39%
% Train images: 100 | Test Images: 100 | k: 2 | Error Rate: 49%
% Train images: 100 | Test Images: 100 | k: 5 | Error Rate: 43%
% Train images: 100 | Test Images: 100 | k: 10 | Error Rate: 60%

% Train images: 1000 | Test Images: 100 | k: 1 | Error Rate: 51%
% Train images: 1000 | Test Images: 100 | k: 2 | Error Rate: 31%
%` Train images: 1000 | Test Images: 100 | k: 5 | Error Rate: 22%
% Train images: 1000 | Test Images: 100 | k: 10 | Error Rate: 16%

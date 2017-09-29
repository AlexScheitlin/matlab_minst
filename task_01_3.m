# Set the number of train images that should be used to classify each of the
# test images (max 60'000).
train_size = 60000;

# Set the number of test images that should be classified (max 10'000).
test_size = 1000;

# Specify whether the result of each image classification should be printed or not.
show_log = 0;

nearest_neighbour(train_size, test_size, show_log);

clear;

% Best Result:
% ?Train images: 10000 | Test Images: 100 | Error Rate: 19%

% All Results:
% Train images: 10 | Test Images: 10 | Error Rate: 70%
% Train images: 100 | Test Images: 10 | Error Rate: 40%
% Train images: 1000 | Test Images: 10 | Error Rate: 40%
% Train images: 10000 | Test Images: 10 | Error Rate: 30%
% Train images: 60000 | Test Images: 10 | Error Rate: 20%

% Train images: 10 | Test Images: 100 | Error Rate: 64%
% Train images: 100 | Test Images: 100 | Error Rate: 35%
% Train images: 1000 | Test Images: 100 | Error Rate: 40%
% ?Train images: 10000 | Test Images: 100 | Error Rate: 19%
% Train images: 60000 | Test Images: 100 | Error Rate: 22%

% Train images: 10 | Test Images: 1000 | Error Rate: 63.3%
% Train images: 100 | Test Images: 1000 | Error Rate: 42%
% Train images: 1000 | Test Images: 1000 | Error Rate: 39.1%
% Train images: 10000 | Test Images: 1000 | Error Rate: 30.9%

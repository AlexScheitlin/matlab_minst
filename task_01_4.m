# Set the number of neighbours that participate during the classification of the
# test image.
k = 10;

# Set the number of train images that should be used to classify each of the
# test images (max 10'000).
train_size = 1000;

# Set the number of test images that should be classified (max 60'000).
test_size = 100;

# Specify whether the result of each image classification should be printed or not.
show_log = 0;

k_nearest_neighbours(k, train_size, test_size, show_log);

clear;

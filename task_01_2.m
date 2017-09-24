# Load the train images and labels.
[images, labels] = load_minst_database('data/train-images-idx3-ubyte', 'data/train-labels-idx1-ubyte', 0);

# Display the first n images.

# Set the total number of images to plot.
n = 4;

# Set the number of images per row.
m = 2;

for i = 1:n
  subplot(ceil(n/m),m,i), imshow(uint8(images(:,:,i)))
end

clear;

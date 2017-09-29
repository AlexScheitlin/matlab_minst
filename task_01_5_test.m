% load required packages
pkg load image;

% don't show the logs
show_log =0 ;

% load the test data
[test_data, test_labels] = load_minst_database('data/t10k-images-idx3-ubyte', 'data/t10k-labels-idx1-ubyte', show_log);

% set the filters
h_average = fspecial('average',3);
h_disk = fspecial('disk',3);
h_gaussian = fspecial('gaussian',3,3);
%h_gaussian = fspecial('gaussian',[5 5],3);
h_laplacian = fspecial('laplacian',0.5);
h_log = fspecial('log',10,10);
h_motion = fspecial('motion',10,10);
h_prewitt = fspecial('prewitt');
h_sobel = fspecial('sobel');

% apply the filters on the first test image
test_image = test_data(:,:,1);
test_image_average = imfilter(test_image,h_average,'replicate');
test_image_disk = imfilter(test_image,h_disk,'replicate');
test_image_gaussian = imfilter(test_image,h_gaussian,'replicate');
test_image_laplacian = imfilter(test_image,h_laplacian,'replicate');
test_image_log = imfilter(test_image,h_log,'replicate');
test_image_motion = imfilter(test_image,h_motion,'replicate');
test_image_prewitt = imfilter(test_image,h_prewitt,'replicate');
test_image_sobel = imfilter(test_image,h_sobel,'replicate');

% position the filtered images on the plot gird
% subplot(number_of_rows, number_of_columns, number_of_position_within_grid)
subplot(3,3,1), imshow(uint8(test_image)), title('original')
subplot(3,3,2), imshow(uint8(test_image_average)), title('average')
subplot(3,3,3), imshow(uint8(test_image_disk)), title('disk')
subplot(3,3,4), imshow(uint8(test_image_gaussian)), title('gaussian')
subplot(3,3,5), imshow(uint8(test_image_laplacian)), title('laplacian')
subplot(3,3,6), imshow(uint8(test_image_log)), title('log')
subplot(3,3,7), imshow(uint8(test_image_motion)), title('motion')
subplot(3,3,8), imshow(uint8(test_image_prewitt)), title('prewitt')
subplot(3,3,9), imshow(uint8(test_image_sobel)), title('sobel')

clear;

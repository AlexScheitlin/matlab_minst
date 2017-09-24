function nearest_neighbour(num_of_train_data, num_of_test_data, show_log)
  %num_of_train_data: The number of training images used to classify one test image.
  %num_of_test_data: The number of test images to classify.
  %show_log: 1 or 0 to specify whether intermediate steps should be printed to the console or not.
  
  % Load the minst train and test datasets.
  if (show_log == 1)
    disp('reading data');
  end
  [train_data, train_labels ] = load_minst_database('data/train-images-idx3-ubyte', 'data/train-labels-idx1-ubyte', show_log);
  [test_data, test_labels] = load_minst_database('data/t10k-images-idx3-ubyte', 'data/t10k-labels-idx1-ubyte', show_log);

  errors = 0;
  
  % n = num_of_test_data
  % Classify the first n images of the minst test dataset.
  for i = 1:num_of_test_data
      % Print the number of the image that is currently classified.
      if (show_log == 1)
        fprintf('%03d - ', i);
      end
      
      % Get the image to be classified.
      test_image = test_data(:,:,i); 
      
      % Transpose the test image matrix into a vector.
      test_image = test_image(:); 
    
      % Minimal found (euclidean) distance between the test and all of the train
      % images.
      min_dist = Inf;
      
      % Index of the test image with the minimal distance to the test image.
      min_index = 0;
      
      % m = num_of_train_data
      % Run through the first m images of the minst train dataset to classify
      % the test image.
      for j = 1:num_of_train_data
          % Get the train image.
          train_image = train_data(:,:,j);
          
          % Transpose the test image matrix into a vector.
          train_image = train_image(:);
          
          % Get the diffrence between the test and train image vectors.
          diff = test_image - train_image;
          
          % Convert difference image from 'uint-8' into double.
          diff = im2double(diff);
          
          % Get the euclidean norm of the test and train image vectors.
          dist = norm(diff,2); 
          
          % Reset the minimal found euclidean distance.
          if(dist < min_dist)
              min_dist = dist;
              min_index = j;
          end
      end
      
      % Get the label of the train image with the lowest euclidean difference
      % to the test image.
      result(i) = train_labels(min_index); 
      
      % Check if the resulting label is the same as expected.
      if (test_labels(i) ~= result(i))
          errors = errors + 1;
      end
      
      % Calculate and print the current accuracy.
      current_accuracy = (i - errors) / i;
      if (show_log == 1)
        fprintf('Current Accuracy: %f - ', current_accuracy);
      end
      
      % If the guess was not correct
      if (test_labels(i) ~= result(i))
        if (show_log == 1)
            fprintf('NO MATCH -  Test label: %d, Training Label %d.\n', test_labels(i), result(i));
        end
          
        % Uncomment to display the test and train images.
        %figure;
        %images = [test_data(:,:,i) train_data(:,:,min_index)];
        %imshow(images);
      else
        if (show_log == 1)
          fprintf('MATCH\n');
        end
      end
  end
  
  % Print the total accuracy.
  fprintf('Tested images: %d | Matches: %d | Mismatches: %d\n', num_of_test_data, num_of_test_data-errors, errors);
  fprintf('Total Accuracy: %d%%\n', round(current_accuracy*100*100)/100);
end

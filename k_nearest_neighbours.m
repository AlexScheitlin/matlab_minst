function k_nearest_neighbours(k, num_of_train_data, num_of_test_data, show_log)
  %k: How many neighbours should participate during the classification of the 
  %   test image.
  %num_of_train_data: The number of training images used to classify one test image.
  %num_of_test_data: The number of test images to classify.
  %show_log: 1 or 0 to specify whether intermediate steps should be printed to the console or not.
  
  % Display waitbar for showing progress.
  h = waitbar(0,'Preparing ...','Name','Classify Test Images',...
            'CreateCancelBtn',...
            'setappdata(gcbf,''canceling'',1)');
  
  % Load the minst train and test datasets.
  if (show_log == 1)
    disp('reading data');
  end
  [train_data, train_labels ] = load_minst_database('data/train-images-idx3-ubyte', 'data/train-labels-idx1-ubyte', show_log);
  [test_data, test_labels] = load_minst_database('data/t10k-images-idx3-ubyte', 'data/t10k-labels-idx1-ubyte', show_log);

  errors = 0;
  
  % n = num_of_test_data
  % Classify the first n images of the minst test dataset.
  %h = waitbar(0,'Initializing waitbar...');
  for i = 1:num_of_test_data
    % Check for Cancel button press.
    if getappdata(h,'canceling')
        fprintf('Aborted!\n');
        break
    end
    
    % Print progress.
    progress = 100/100/num_of_test_data*i;
    waitbar(progress, h, sprintf('%d%%',progress*100));
    
    % Print the number of the image that is currently classified.
    if (show_log == 1)
      fprintf('%03d - ', i);
    end
    
    % Get the image to be classified.
    test_image = test_data(:,:,i); 
    
    % Transpose the test image matrix into a vector.
    test_image = test_image(:); 
  
    % K minimal found (euclidean) distances between the test and all of the
    % train images.
    min_dists = inf(k,1);
    
    % K indices of the test image with the minimal distances to the test
    % image.
    min_indices = zeros(k,1);
    
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
      
      % If the index of the current image is lower than k just add it's
      % index and distance as one of the lowest distances.
      if (j <= k)
        min_dists(j) = dist;
        min_indices(j) = j;
      else
        % The maximal distance of the k lowest distances and
        % the array index of this maximal distance.
        [max_dist, index] = max(min_dists);
        
        % If the distance is lower than the maximal distance of the k images
        % replace that distance with the lower one.
        if (dist < max_dist)
          min_dists(index) = dist;
          min_indices(index) = j;
        end
      end
    end
    
    % Get all the labels of the k train images with the lowest euclidean
    % difference to the test image.
    for j = 1:k
      min_labels(j) = train_labels(min_indices(j));
    end
    
    % Get the most occuring label.
    result(i) = mode(min_labels);
    
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
    else
      if (show_log == 1)
        fprintf('MATCH\n');
      end
    end
  end
  waitbar(1, h, 'Finishing ...');
  
  % Print the total accuracy.
  %fprintf('Tested images: %d | Matches: %d | Mismatches: %d\n', num_of_test_data, num_of_test_data-errors, errors);
  %fprintf('Total Accuracy: %d%%\n', round(current_accuracy*100*100)/100);
  %fprintf('Total Error Rate: %d%%\n', 100 - round(current_accuracy*100*100)/100);
  fprintf('Train images: %d | Test Images: %d | k: %d | Error Rate: %d%%\n', num_of_train_data, num_of_test_data, k, 100 - round(current_accuracy*100*100)/100)

  % Close waitbar.
  close(h);
end

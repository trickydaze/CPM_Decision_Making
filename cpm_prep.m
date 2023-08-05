
Food_dFC_perm_all1_roi=reshape(Food_dFC_all1,[214,214,9]);
Cards_dFC_perm_all1_roi=reshape(Cards_dFC_all1,[214,214,9]);
Discount_dFC_perm_all1_roi=reshape(Discount_dFC_all1,[214,214,9]);

%%
Food_dFC_perm_all1_roi1=permute(Food_dFC_all1,[2,3,1]);
Cards_dFC_perm_all1_roi1=permute(Cards_dFC_all1,[2,3,1]);
Discount_dFC_perm_all1_roi1=permute(Discount_dFC_all1,[2,3,1]);
clear dFC_features_all
dFC_features_all=cat(3,Food_dFC_perm_all1_roi1, Cards_dFC_perm_all1_roi1, Discount_dFC_perm_all1_roi1);
dFC_index = [ones(1,9) 2*ones(1,9) 3*ones(1,9)]';
%%
clc
n=length(dFC_index)
idx = randperm(n);
for i=1:length(idx)
dFC_index_sh(i) = dFC_index(idx(i));
dFC_features_all_sh(:,:,i) = dFC_features_all(:,:,idx(i));
end
dFC_index_sh
idx

%% without Cross Validation
num_tasks = size(dFC_features_all, 3);
num_regions = size(dFC_features_all, 1);
dFC_features_all_reshaped = reshape(dFC_features_all, num_regions, num_regions*num_tasks);

% Shuffle the data and labels while keeping them matched
perm = randperm(num_tasks);
dFC_features_all_reshaped = dFC_features_all_reshaped(:, perm);
dFC_index = dFC_index(perm);

% Split data into training and testing sets (80% for training, 20% for testing)
num_train = round(0.9 * num_tasks);
X_train = dFC_features_all_reshaped(:, 1:num_train);
y_train = dFC_index(1:num_train);
X_test = dFC_features_all_reshaped(:, num_train+1:end);
y_test = dFC_index(num_train+1:end);
% Create a CPM model (ridge regression with regularization parameter lambda)
lambda = 0.1; % adjust the regularization strength as needed
model = fitrlinear(X_train', y_train, 'Regularization', 'ridge', 'Lambda', lambda);

% Predict the task labels for the test set
y_pred = predict(model, X_test');

% Convert predictions to integer labels
y_pred = round(y_pred);


% Evaluate the prediction accuracy (you can use other metrics as well)
accuracy = sum(y_pred == y_test) / length(y_test);

disp(['Accuracy: ', num2str(accuracy)]);
%% with Cross Validation
num_tasks = size(dFC_features_all, 3);
num_regions = size(dFC_features_all, 1);
dFC_features_all_reshaped = reshape(dFC_features_all, num_regions, num_regions*num_tasks);

% Shuffle the data and labels while keeping them matched
perm = randperm(num_tasks);
dFC_features_all_reshaped = dFC_features_all_reshaped(:, perm);
dFC_index = dFC_index(perm);

% Number of folds for cross-validation
num_folds = 3;

% Preallocate an array to store accuracy values for each fold
accuracy_values = zeros(num_folds, 1);

% Perform k-fold cross-validation
for fold = 1:num_folds
    % Split data into training and testing sets for this fold
    fold_size = round(num_tasks / num_folds);
    test_idx = (fold-1)*fold_size + 1 : fold*fold_size;
    train_idx = setdiff(1:num_tasks, test_idx);
    
    X_train = dFC_features_all_reshaped(:, train_idx);
    y_train = dFC_index(train_idx);
    X_test = dFC_features_all_reshaped(:,test_idx);
    y_test = dFC_index(test_idx);
    
    % Create a CPM model (ridge regression with regularization parameter lambda)
    lambda = 0.1; % adjust the regularization strength as needed
    model = fitrlinear(X_train', y_train, 'Regularization', 'ridge', 'Lambda', lambda);

    % Predict the task labels for the test set
    y_pred = predict(model, X_test');

    % Convert predictions to integer labels
    y_pred = round(y_pred);

    % Evaluate the prediction accuracy for this fold
    
    accuracy = sum(y_pred == y_test) / length(y_test);
    accuracy_values(fold) = accuracy;
end

% Calculate and display the mean accuracy across all folds
mean_accuracy = mean(accuracy_values);
disp(['Mean Accuracy: ', num2str(mean_accuracy)]);
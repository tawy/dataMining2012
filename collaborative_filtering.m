%% Import data
learning_set = importdata('ua.base');
validation_set = importdata('ua.test');
% Trim the timestam from the data
learning_set = learning_set(:, 1:3);
validation_set = validation_set(:, 1:3);

%% Format data
user_matrix = create_user_matrix(learning_set);
[test, avg] = weigh_user(user_matrix);

%% Validation
diff_predict = validation(user_matrix, avg, test, validation_set);
[n,x] = hist(diff_predict, 0.25:0.5:4.25);
bar(x,100*n./sum(n),1,'hist');

%% Clear unused variables
clear n x
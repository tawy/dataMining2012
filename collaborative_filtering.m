%% Import data
learning_set = importdata('ua.base');
% Trim the timestam from the data
learning_set = learning_set(:, 1:3);

%% Format data
user_matrix = create_user_matrix(learning_set);

disp(user_matrix(1:10, :));
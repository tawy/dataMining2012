function diff_prediction = validation(user_ratings, user_average, weight_matrix, validation_set)

diff_prediction = zeros(size(validation_set,1),1);

for rating = 1:size(validation_set,1)
    user = validation_set(rating, 1);
    movie= validation_set(rating, 2);
    true_rating  = validation_set(rating, 3);
    diff_prediction(rating) = abs ( true_rating - ... 
        prediction(user_ratings,user_average,weight_matrix, user, movie));
end
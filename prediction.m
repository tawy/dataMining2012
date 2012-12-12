function predicted_rate = prediction(user_ratings, user_average, weight_matrix, user_id, movie_id)

% Return the true value if user_id has already rated movie_id
if (~isnan(user_ratings(movie_id,user_id)))
    predicted_rate = user_ratings(movie_id,user_id);
    return;
end

% Compute the upper and lower part of the fraction (paper p7 2nd column)
pred=0;
norm=0;
for user_cur=1:size(user_ratings,2)
    if (~isnan(user_ratings(movie_id,user_cur)))
        pred = pred + weight_matrix(user_cur, user_id) * ...
              (user_ratings(movie_id,user_cur) - user_average(user_cur));
        norm = norm + abs(weight_matrix(user_cur, user_id));
    end
end

% final value of the fraction
adaptive_rate = 0;
if (norm ~= 0) 
    adaptive_rate = pred/norm; 
end

predicted_rate = user_average(user_id) + adaptive_rate;
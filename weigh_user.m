function [ weight_matrix, user_avg ] = weigh_user(user_ratings)
%Computes the correlation between two user so as to dermine their weight in
%the rating for one of the user.
%   Input: Sample matrix of rating
%   Output:
%       The weight of each user compared to the other, weight_matrix(i, j)
%           contains the weight of the user j for the user i.
%       The average rating for each user

%Computes the average grade the user has given to every movie he graded
user_avg = NaN(size(user_ratings, 2), 1);
for user = 1:size(user_ratings, 2)
    movie_rating_sum = 0;
    nb_rating = 0;
    for movie = 1:size(user_ratings, 1)
        if (~isnan(user_ratings(movie, user)))
            movie_rating_sum = movie_rating_sum + user_ratings(movie, user);
            nb_rating = nb_rating + 1;
%            disp(nb_rating);
%            disp(user_ratings(movie, user));
        end
    end
    user_avg(user) = movie_rating_sum / nb_rating;
end


%Compute the user covariance matrix
user_cov = NaN(size(user_ratings, 2), size(user_ratings, 2));
for user_a = 1:size(user_ratings, 2)
    for user_b = 1:size(user_ratings, 2)
        sum_cov = 0;
        is_cov = false;
        for movie = 1:size(user_ratings, 1)
            if (~( ...
                    (isnan(user_ratings(movie, user_a))) ...
                ||  (isnan(user_ratings(movie, user_b)))))
                sum_cov = sum_cov + ...
                        ((user_ratings(movie, user_a) - user_avg(user_a)) * ...
                        (user_ratings(movie, user_b) - user_avg(user_b)));
                is_cov = true;
            end
        end
        if (is_cov)
            user_cov(user_a, user_b) = sum_cov;
        end
    end
end

%Normalize the covariance matrix to weights 
weight_matrix = NaN(size(user_ratings, 2), size(user_ratings, 2));
for user_a = 1:size(user_ratings, 2)
    for user_b = 1:size(user_ratings, 2);
        if (~( ...
                    (isnan(user_ratings(movie, user_a))) ...
                ||  (isnan(user_ratings(movie, user_b)))))
            weight_matrix(user_a, user_b) = user_cov(user_a, user_b) / ...
                (sqrt(user_cov(user_a, user_a)) * sqrt(user_cov(user_b, user_b)));
        end
    end
end
end
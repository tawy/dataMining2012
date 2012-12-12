function [ weight_matrix ] = weigh_user(user_ratings)
%Computes the correlation between two user so as to dermine their weight in
%the rating for one of the user.
%   Input: Sample matrix of rating
%   Output: The weight of each user compared to the other, 
%   weight_matrix(i, j) contains the weight of the user j for the user i.

user_avg = zeros(size(user_ratings, 2), 1);
%Computes the average grade the user has given to every movie he graded
for user = 1:size(user_ratings, 2)
    movie_rating_sum = 0;
    nb_rating = 0;
    for movie = 1:size(user_ratings, 1)
        if (~isnan(user_ratings(movie, user)))
            movie_rating_sum = movie_rating_sum(movie, user);
            nb_rating = nb_rating + 1;
        end
    end
    user_avg(user) = movie_rating_sum / nb_rating;
end

user_avg = zeros(size(user_ratings, 2), size(user_ratings, 2));
%Construct the covariance matrix now
% 
% weight_matrix = NaN(size(user_ratings, 2), size(user_ratings, 2));
% for user_a = 1:size(user_ratings, 2)
%     for user_b = 1:size(user_ratings, 2);
%         weight_matrix();
%     end
% end


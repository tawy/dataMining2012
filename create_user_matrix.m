function [ user_rating ] = create_user_matrix( ratings )
%Creates the ratings matrix following those specification:
%Line: Objects rated
%Column: User who rated the object
%Value at (i, j): Rate given by the user to this object
%   Input: Ratings
user = 1;
film = 2;
rating = 3;

user_rating = NaN(size(unique(ratings(:, film)), 1), ...
                    size(unique(ratings(:, user)), 1));

%Fill the rating matrix
for i = 1:size(ratings)
    user_rating(ratings(i, film), ratings(i, user)) = ratings(i, rating);
end

end
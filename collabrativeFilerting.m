%task: predict one user's rating on a new film which he hasn't watched.
data=importdata('ua.base');
len=size(data,1);
raw=data(:,1:3);
uim=zeros(943,1682);
for i=1:len
    uim(raw(i,1),raw(i,2))=raw(i,3);
end
%set the parameter user_id=? film_id=?
% user_id=10;
% film_id=10;
% if uim(user_id,film_id)~=0
%     disp(uim(user_id,film_id));
% else
%      top=10;
%      % Matrix similarUsers has top rows and three columns: the first
%      % column is the user_id,the 2nd is the similarity and the 3rd is the
%      % rate from this similar user.
%      similarUsers=zeros(top,3);
%      for i=1:943
%          if uim(i,film_id)~=0
%              similarity=caculateSimilarity(uim,user_id,i);
%              similarUsers=updateList(uim,similarUsers,similarity,i,film_id);
%          end
%      end
%      
%      totalWeight=sum(similarUsers(:,2));
%      weight=similarUsers(:,2)/totalWeight;
%      predicted_rate=similarUsers(:,3)'*weight;
%      disp(predicted_rate);
% end

% estimate error on the test data set

testset=importdata('ua.test');
% len2=size(testset,1);
len2=1000;
predict=zeros(len2,1);
for i=1:len2
    user_id=testset(i,1);
    film_id=testset(i,2);
    if uim(user_id,film_id)~=0
        disp(uim(user_id,film_id));
    else
         top=10;
         % Matrix similarUsers has top rows and three columns: the first
         % column is the user_id,the 2nd is the similarity and the 3rd is the
         % rate from this similar user.
         similarUsers=zeros(top,3);
         for j=1:943
             if uim(j,film_id)~=0
                 similarity=caculateSimilarity(uim,user_id,j);
                 similarUsers=updateList(uim,similarUsers,similarity,j,film_id);
             end
         end

         totalWeight=sum(similarUsers(:,2));
         weight=similarUsers(:,2)/totalWeight;
         predict(i,1)=similarUsers(:,3)'*weight;
    end
end
temp=testset(1:len2,:);

for i=1:len2
    if predict(i,1)>=3
        predict(i,1)=1;
    else
        predict(i,1)=0;
    end
    
    if temp(i,3)>=3
        temp(i,3)=1;
    else
        temp(i,3)=0;
    end
end

error=0;
for i=1:len2
    if temp(i,3)~=predict(i,1)
        error=error+1;
    end
end
disp(error/len2);
    




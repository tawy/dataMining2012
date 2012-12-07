function simi=caculateSimilarity(uim,user_id,u)
     compare_array=zeros(2,1682);
     index=1;
     for i=1:1682
         if uim(user_id,i)~=0 && uim(u,i)~=0
             compare_array(1,index)=uim(user_id,i);
             compare_array(2,index)=uim(u,i);
             index=index+1;
         end
     end
     if index==1
         simi=0;
         return;
     else
     compare_array=compare_array(:,1:index-1);
     simi=1-pdist(compare_array,'cosine');
     end
end
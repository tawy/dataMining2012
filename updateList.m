function simiUsers=updateList(uim,simiU,similarity,user_id,film_id)
         index=1;
         len=size(simiU,1);
         while index<=len && similarity<simiU(index,2)
             index=index+1;
         end
         if index>len
             simiUsers=simiU;
             return;
         else
             for i=len:-1:index+1
                 simiU(i,:)=simiU(i-1,:);
             end
             simiU(index,1)=user_id;
             simiU(index,2)=similarity;
             simiU(index,3)=uim(user_id,film_id);
         end
         
         simiUsers=simiU;
         return
end
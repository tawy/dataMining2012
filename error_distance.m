function error = error_distance(predict, trueval, maxdist)

error=0;
len=size(predict,1);
for i=1:len
    if abs(predict(i,1)-trueval(i,1)) > maxdist
        error = error+1;
    end
end

error = error/len;
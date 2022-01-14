for i=1:5
total_count(i,:)=countmember([1 2 3 4 5 6 7 8 9], idvalue(i,:))
[val, imfnumber(i)]=max(total_count(i,:));
end
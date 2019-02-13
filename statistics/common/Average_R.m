%Input:  Matrix

%Description:  Calculates, for each row, the average of the entries in that
%row.  

%Output:  Vector (Column)

function average=Average_R(x)
format long
average=x(:,1);
for i=2:length(x(1,:))
    average=average+x(:,i);
end
average=average/length(x(1,:));
end

%Input:  Matrix

%Description:  Calculates, for each row, the average distance to the mean.

%Output:  Vector (Column)

function z=Average_Absolute_Deviation_R(x)
format long
y=Average_R(x);
z=[];
for i=1:length(x(:,1))
    temp=0;
    for j=1:length(x(1,:))
        temp=temp+abs(x(i,j)-y(i));
    end
    z(i)=temp;
end
z=z'/length(x(1,:));

end
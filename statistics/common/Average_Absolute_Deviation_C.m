%Input:  Matrix

%Description:  Calculates, for each column, the average distance to the mean.

%Output:  Vector (Row)


function z=Average_Absolute_Deviation_C(x)
format long
y=Average_C(x);
z=[];
for i=1:length(x(1,:))
    temp=0;
    for j=1:length(x(:,1))
        temp=temp+abs(x(j,i)-y(i));
    end
    z(i)=temp;
end
z=z/length(x(:,1));

end
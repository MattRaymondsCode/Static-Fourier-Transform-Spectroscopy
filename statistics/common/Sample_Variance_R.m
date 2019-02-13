%Input:  Matrix

%Description:  For each row, returns the sample variance.

%Output:  Vector (Column)


function sample_variance=Sample_Variance_R(x)
format long
y=Average_R(x);
sample_variance=[];
for i=[1:length(x(:,1))]
    temp=0;
    for j=[1:length(x(1,:))]
        temp=temp+x(i,j)^2;
    end
    sample_variance(i)=temp-length(x(1,:))*y(i)^2;
end
sample_variance=sample_variance'/(length(x(1,:))-1);

end
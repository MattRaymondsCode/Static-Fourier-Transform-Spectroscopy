%Input:  Matrix

%Description:  For each column, returns the sample variance.

%Output:  Vector (Row)

function sample_variance=Sample_Variance_C(x)
format long
y=Average_C(x);
sample_variance=[];
for i=[1:length(x(1,:))]
    temp=0;
    for j=[1:length(x(:,1))]
        temp=temp+x(j,i)^2;
    end
    sample_variance(i)=temp-length(x(:,1))*y(i)^2;
end
sample_variance=sample_variance/(length(x(:,1))-1);

end
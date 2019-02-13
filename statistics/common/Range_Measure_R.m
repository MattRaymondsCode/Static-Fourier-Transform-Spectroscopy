%Input:  Matrix

%Description:  Calculates the difference between the max & min for each row

%Output:  Vector (Column)

function y=Range_Measure_R(x)
format long
y=[];
for i=1:length(x(:,1));
    y(i)=abs(max(x(i,:))-min(x(i,:)));
end
y=y';
end

    
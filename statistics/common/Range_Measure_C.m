%Input:  Matrix

%Description:  Calculates the difference between the max & min for each
%column

%Output:  Vector (Row)

function y=Range_Measure_C(x)
format long
y=[];
for i=1:length(x(1,:));
    y(i)=abs(max(x(:,i))-min(x(:,i)));
end
end
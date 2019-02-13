%Input:  Matrix

%Description:  The difference between the max & min is calculated for each
%column, & the maximum of these values is returned.

%Output:  Number

function y=Range_Measure_C_Max(x)
format long
temp=[];
for i=1:length(x(1,:));
    temp(i)=abs(max(x(:,i))-min(x(:,i)));
end
y=max(temp);


end
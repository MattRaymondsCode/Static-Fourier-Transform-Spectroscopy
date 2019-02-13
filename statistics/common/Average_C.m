%Input:  Matrix

%Description:  Calculates, for each column, the average of the entries in that
%column.  

%Output:  Vector (Row)

function y=Average_C(x)

format long

M=length(x(:,1));
N=length(x(1,:));
y=[];

for i=1:N;
    y(1,i)=0;
    for j=1:M;
        y(1,i)=y(1,i)+x(j,i);
    end
end

y=y/M;
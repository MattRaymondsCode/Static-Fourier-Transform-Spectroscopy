function y=Discontinuities_C(x)

format long

M=length(x(:,1));
N=length(x(1,:));
y=[];

for j=1:N;
    for i=1:M-1;
        y(i,j)=abs(x(i,j)-x(i+1,j));
    end
end
end
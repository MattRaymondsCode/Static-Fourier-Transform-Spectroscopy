function y=Discontinuities_R(x)

format long

M=length(x(:,1));
N=length(x(1,:));
y=[];

for i=1:M;
    for j=1:N-1;
        y(i,j)=abs(x(i,j)-x(i,j+1));
    end
end
end



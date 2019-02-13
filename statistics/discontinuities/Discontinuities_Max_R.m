function y=Discontinuities_Max_R(x)

format long

temp=Discontinuities_R(x);

y=[];

for i=1:length(temp(:,1))
   y(i,1)=max(temp(i,:));
end

end
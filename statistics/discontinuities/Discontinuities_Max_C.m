function y=Discontinuities_Max_C(x)

format long

temp=Discontinuities_C(x);

y=[];

for i=1:length(temp(1,:))
   y(1,i)=max(temp(:,i));
end

end
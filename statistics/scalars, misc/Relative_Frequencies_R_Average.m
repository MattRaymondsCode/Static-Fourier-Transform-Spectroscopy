function y=Relative_Frequencies_R_Average(x)

format long

temp=Relative_Frequencies_R(x);

n=0;
sum=0;

for i=1:length(temp(:,1,1))
    for j=1:length(temp(1,:,1))
        if temp(i,j,2)~=0
            sum=sum+temp(i,j,2);
            n=n+1;
        end
    end
end

y=sum/n;

end
function Histogram_3D_Display(m)

format long
temp=Relative_Frequencies_T(m);
x=[];y=[];z=[];
for i=1:length(temp(:,1,1))
    for j=1:length(temp(1,:,1))
        if temp(i,j,2)~=0
            x(end+1)=temp(i,j,1);
            y(end+1)=i;
            z(end+1)=temp(i,j,2);
        end
    end
end
scatter3(x,y,z)
end
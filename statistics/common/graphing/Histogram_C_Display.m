%Input:  Matrix (3D)

%Description: Transforms the 3-dimensional matrix produced by Relative_Frequencies into 3 row vectors to be graphed my the macro below.

%x records the the unique values of each row (for each row- one long sequential list).
%y records their original row (on account of the above)
%z records their relative frequencies


%The graph macro then plots y (the row numbers) on
%the horizontal axis, above which is their unique values (x), & the color
%of each point corresponds to the relative frequency. 

%Output:  Graph (displayed)


function Histogram_C_Display(m)
 
format long

q=Average_C(m);
temp=Relative_Frequencies_C(m);
N=length(m(:,1));
M=length(m(1,:));

x=[];y=[];z=[];

for i=1:length(temp(1,:,1))
    for j=1:length(temp(:,1,1))
        if temp(j,i,2)~=0
            x(end+1)=temp(j,i,1);
            y(end+1)=i;
            z(end+1)=temp(j,i,2);
        end
    end
end

Histogram_C_Macro_Display(y,x,1500,z,Sample_Variance_C(m),Range_Measure_C_Max(m),q,N,M);



end
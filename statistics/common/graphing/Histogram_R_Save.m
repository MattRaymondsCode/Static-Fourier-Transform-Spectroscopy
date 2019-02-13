%Input:  Matrix (3D)

%Description: Transforms the 3-dimensional matrix produced by Relative_Frequencies into 3 row vectors to be graphed my the macro below.

%x records the the unique values of each row (for each row- one long sequential list).
%y records their original row (on account of the above)
%z records their relative frequencies


%The graph macro then plots y (the row numbers) on
%the horizontal axis, above which is their unique values (x), & the color
%of each point corresponds to the relative frequency. 

%Output:  Graph (displayed)


function Histogram_R_Save(m,filename)
 
format long

q=Average_R(m);
temp=Relative_Frequencies_R(m);
N=length(m(1,:));

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

Histogram_R_Macro_Save(y,x,1,z,Sample_Variance_R(m),Range_Measure_R_Max(m),q,N,filename);

clf
close(gcf)

%clf & close(gcf) clear & close the current figure, respectively.  This is
%FUCKING NECESSARY! here & in any called functions involving images, to avoid
%maxing out RAM.  The reduction was +40% in running Histograms_Folder.  Their placement here intuitively follows following image saving, 
%but also has been determined by trial & error. 
%Incorrect placement results in large RAM spikes.  The clear all command
%results in the same problem, or just additional memory use (maybe functions
%are cleared that shouldn't be- or who knows what). 

end
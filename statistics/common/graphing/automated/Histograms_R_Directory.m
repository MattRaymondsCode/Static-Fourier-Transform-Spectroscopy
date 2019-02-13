function Histograms_R_Directory(input,output)

format long


y=Directory_Data_Search(input,output);

for i=1:length(y(:,1))
    Histograms_R_Folder([input y{i,1}],[output y{i,1}]);
end

end

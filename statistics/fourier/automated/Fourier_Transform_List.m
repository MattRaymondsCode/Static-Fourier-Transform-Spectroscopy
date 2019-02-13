function Fourier_Transform_List(list,input,output)

format long

mkdir([output '\0']);

[parameters,filenames,~]=xlsread(list,'A4:C120');

for i=1:length(filenames(:,1))
    Fourier_Transform_Save([input '\' filenames{i,1}(1:end-12) ' (averages)' '.csv'],parameters(i,1),parameters(i,2),[output '\0\' filenames{i,1}]);
end
Sort_By_Element([output '\0'],output);
Sort_By_Model([output '\0'],output);

end
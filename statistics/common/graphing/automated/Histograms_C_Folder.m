function Histograms_C_Folder(input,output)

format long

sample_dir=dir([input '\*.csv']);

for i=1:length(sample_dir(:,1))
    temp=CSV_1_1_To_Matrix([input '\' sample_dir(i,1).name]);
    Histogram_C_Save(temp,[output '\' sample_dir(i,1).name(1:end-4)]);
    clf
    close(gcf)
    clear Histogram_C_Save
    clear temp
end
end
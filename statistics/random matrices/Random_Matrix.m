function Random_Matrix(input,output)

format long

temp=clock;

label=[num2str(mod(temp(1),100)) '.' num2str(temp(2)) '.' num2str(temp(3)) '.' num2str(sprintf('%02d',temp(4))) '.' num2str(sprintf('%02d',temp(5)))];

x=rand(2048);

Matrix_To_CSV(x,[output '\matrices\' label '.csv']);

mkdir([output '\graphs\' label]);
mkdir([output '\excel files\' label]);

sample_dir=dir([input '\*.csv']);

for i=1:length(sample_dir(:,1))
    temp=CSV_0_0_To_Matrix([input '\' sample_dir(i,1).name]);
    y=x*temp;
    y=y/norm(y);
    Matrix_To_CSV(y,[output '\excel files\' label '\' sample_dir(i,1).name]);
    Random_Matrix_Save_Macro(y,[output '\graphs\' label '\' sample_dir(i,1).name]);
    clf
    close(gcf)
end

end
    
    
    







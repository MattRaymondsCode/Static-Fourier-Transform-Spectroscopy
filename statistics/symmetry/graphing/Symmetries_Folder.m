function Symmetries_Folder(input,output)

mkdir([output '\excel files']);
mkdir([output '\graphs']);

x=dir([input '\*.csv']);
N=length(x(:,1));

for i=1:N
    y=CSV_0_0_To_Matrix([input '\' x(i,1).name]);
    z=[];
    for j=1:length(y(:,1))
        z(j,1)=j;
    end
    symmetry_correspondence_loss=Symmetry_Correspondence_Loss(y);
    symmetry_distance_loss=Symmetry_Distance_Loss(y);
    Symmetries_Macro_Save(z,y,symmetry_correspondence_loss,symmetry_distance_loss,[output '\graphs\' x(i,1).name(1:end-4)]);
    Matrix_To_CSV(y,[output '\excel files\' x(i,1).name(1:end-14) '(' num2str(sprintf('%04d',symmetry_correspondence_loss)) ',' num2str(sprintf('%04d',symmetry_distance_loss)) ').csv']);
    clf
    close(gcf)

end

end


function Symmetry_Correspondence_Loss_Folder(input,output)

x=dir([input '\*.csv']);
N=length(x(:,1));

for i=1:N
    y=CSV_0_0_To_Matrix([input '\' x(i,1).name]);
    z=[];
    for j=1:length(y(:,1))
        z(j,1)=j;
    end
    symmetry_correspondence_loss=Symmetry_Correspondence_Loss(y);
    Symmetries_Macro_Save(z,y,symmetry_correspondence_loss,[],[output '\' x(i,1).name(1:end-4)]);
    
    clf
    close(gcf)

end

end


%Input:  Directory containing jpg's of sample data, desired output
%directory

%Description:  jpg's are organized into folders created in the output
%directory based on type of sample


function Sort_By_Element(input,output)

mkdir([output '\H']);
mkdir([output '\HeNe']);
mkdir([output '\Hg']);
mkdir([output '\LB']);
mkdir([output '\Na']);

x=dir([input '\*.jpg']);

N=length(x(:,1));

for i=1:N
    if x(i,1).name(20:23)=='HeNe'
        copyfile([input '\' x(i,1).name],[output '\HeNe\' x(i,1).name])
        continue
    end
    if x(i,1).name(20:21)=='Hg'
        copyfile([input '\' x(i,1).name],[output '\Hg\' x(i,1).name])
        continue
    end
    if x(i,1).name(20)=='H'
        copyfile([input '\' x(i,1).name],[output '\H\' x(i,1).name])
        continue
    end
    if x(i,1).name(20:21)=='LB'
        copyfile([input '\' x(i,1).name],[output '\LB\' x(i,1).name])
        continue
    end
    if x(i,1).name(20:21)=='Na'
        copyfile([input '\' x(i,1).name],[output '\Na\' x(i,1).name])
    end
end

end
        
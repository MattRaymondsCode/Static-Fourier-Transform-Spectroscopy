%Input:  Directory containing jpg's of sample data, desired output
%directory

%Description:  jpg's are organized into folders created in the output
%directory based on what model their sample data was measured with

function Sort_By_Model(input,output)

mkdir([output '\15.07.01.1']);
mkdir([output '\15.07.30.1']);
mkdir([output '\15.07.30.2']);
mkdir([output '\15.07.30.3']);
mkdir([output '\15.07.31.1']);

x=dir([input '\*.jpg']);

N=length(x(:,1));

for i=1:N
    if x(i,1).name(7:8)=='01'
        copyfile([input '\' x(i,1).name],[output '\15.07.01.1\' x(i,1).name])
        continue
    end
    if x(i,1).name(7:10)=='30.1'
        copyfile([input '\' x(i,1).name],[output '\15.07.30.1\' x(i,1).name])
        continue
    end
    if x(i,1).name(7:10)=='30.2'
        copyfile([input '\' x(i,1).name],[output '\15.07.30.2\' x(i,1).name])
        continue
    end
    if x(i,1).name(7:10)=='30.3'
        copyfile([input '\' x(i,1).name],[output '\15.07.30.3\' x(i,1).name])
        continue
    end
    if x(i,1).name(7:8)=='31'
        copyfile([input '\' x(i,1).name],[output '\15.07.31.1\' x(i,1).name])
    end
end
end

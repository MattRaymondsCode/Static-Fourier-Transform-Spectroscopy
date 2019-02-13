function Label_For_Latex(input,list)

mkdir([input '\latex']);
temp=dir([Desktop 'by sample\*.csv']);
y={};

for i=1:length(temp(:,1))
    y{i,1}=temp(i,1).name(1:18);
end

temp=dir([input '\0\*.jpg']);

for i=1:length(temp(:,1))
    for j=1:length(y(:,1))
        if strcmp(temp(i,1).name(1:18),y(j,1))
            copyfile([input '\0\' temp(i,1).name],[input '\latex\' num2str(j) '.jpg']);
            break
        end
    end
end

end
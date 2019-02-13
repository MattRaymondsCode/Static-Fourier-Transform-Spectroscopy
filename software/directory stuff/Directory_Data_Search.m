%Input:  Directory with subfolders containing desired CSV files, desired
%output directory

%Description: This goes into a selected directory, copies the same folder
%structure into the desired directory, & returns an array containing the
%addresses of all folders & subfolders that contain CSV files.  

%The intent was to automate analysis while allowing samples to be organized 
%into directories at the experimenter's will.  This was later obviated when
%it was found to be beneficial to organize all samples chronologically with
%time stamp.  

%Output:  Array


function d=Directory_Data_Search(input,output)

format long

%The variable q keeps track of the recursion iteration such that the
%directory listing is returned at the end.

persistent q
if isempty(q)
    q=0;
end

%N is used to truncate the directory to specifics- so that the original
%location & duplicated location may later be addressed with the same string.

persistent N
if isempty(N);
    N=length(input);
end

%z is the directory of all folders containing csv files

persistent z
if isempty(z)
    z={};
end

%if the folder contains csv files, it is added to the directory

x=dir(input);
if ~isempty(dir([input '\*.csv']))
   z{end+1,1}=input(N+1:end); 
end

%if the folder contains another folder, Directory_Data_Search is called
%recursively

if ismember(1,[x(3:end).isdir])
    for i=3:length(x)
        if x(i,1).isdir==1
            mkdir([output '\' x(i,1).name]);
            q=q+1;
            Directory_Data_Search([input '\' x(i,1).name],[output '\' x(i,1).name]);
        end
    end
end

if q==0
    d=z;
    clear z
else
    q=q-1;
end

end
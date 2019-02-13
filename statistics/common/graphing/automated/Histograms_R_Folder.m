%Input:  Directory containing sample CSV files, Desired output directory

%Description:  The folders shown below are added to the designated output
%directory, into which are organized

%--Histogram (with statistics) of raw background data
%--For each background measurement a CSV file is produced containing the
%average values as a column vector
%--Histogram (with statistics) of each raw sample
%--Histogram (with statistics) of each sample with respective background
%averge subtracted
%--For each sample a CSV file is produced containing the average values as a
%column vector; another is produced with the background average subtracted

%Output:  Images, CSV files, directories

function Histograms_R_Folder(input,output)

format long

mkdir([output '\statistics (raw)']);
mkdir([output '\statistics (adjusted)']);
mkdir([output '\statistics (raw)\graphs']);
mkdir([output '\statistics (raw)\excel files']);
mkdir([output '\statistics (adjusted)\graphs']);
mkdir([output '\statistics (adjusted)\excel files']);
mkdir([output '\excel files (background corrected)']);

sample_dir=dir([input '\*.csv']);

backgrounds=[];

for i=1:length(sample_dir(:,1))
    if length(sample_dir(i,1).name)<29
        continue
    else
        if sample_dir(i,1).name(20:29)=='background'
            backgrounds(end+1,1)=i;
        end
    end
end

N=length(backgrounds(:,1));


for i=1:N
    background=CSV_1_1_To_Matrix([input '\' sample_dir(backgrounds(i,1),1).name]);
    Histogram_R_Save(background,[output '\statistics (raw)\graphs\' sample_dir(backgrounds(i,1),1).name(1:end-4)]);
    clf
    close(gcf)
    
    background_average=Average_R(background);
    clear background
    Matrix_To_CSV(background_average,[output '\statistics (raw)\excel files\' sample_dir(backgrounds(i,1),1).name(1:end-4) ' (averages).csv']);

    if N==i
        M=length(sample_dir(:,1))-backgrounds(i,1);
    else
        M=backgrounds(i+1,1)-backgrounds(i,1)-1;
    end
    
    for j=backgrounds(i,1)+1:backgrounds(i,1)+M
        sample=CSV_1_1_To_Matrix([input '\' sample_dir(j,1).name]);
        Histogram_R_Save(sample,[output '\statistics (raw)\graphs\' sample_dir(j,1).name(1:end-4)]);
        clf
        close(gcf)

        corrected_data=sample-background_average(:,ones(1,length(sample(1,:))));
        Matrix_To_CSV(corrected_data,[output '\excel files (background corrected)\' sample_dir(j).name(1:end-4) '.csv']);
        Histogram_R_Save(corrected_data,[output '\statistics (adjusted)\graphs\' sample_dir(j).name(1:end-4)]);
        clf
        close(gcf)
        clear corrected_data
    
        sample_average=Average_R(sample);
        clear sample
        Matrix_To_CSV(sample_average,[output '\statistics (raw)\excel files\' sample_dir(j).name(1:end-4) ' (averages).csv']);

        corrected_sample=sample_average-background_average;
        clear sample_average

        Matrix_To_CSV(corrected_sample,[output '\statistics (adjusted)\excel files\' sample_dir(j).name(1:end-4) ' (averages).csv']);
        clear corrected_sample
    end
    
    clear background_average
    
end
end

%clf & close(gcf) clear & close the current figure, respectively.  This is
%FUCKING NECESSARY! here & in any called functions involving images, to avoid
%maxing out RAM.  The reduction was +40% in running Histograms_Folder.  Their placement here intuitively follows following image saving, 
%but also has been determined by trial & error. 
%Incorrect placement results in large RAM spikes.  The clear all command
%results in the same problem, or just additional memory use (maybe functions
%are cleared that shouldn't be- or who knows what). 
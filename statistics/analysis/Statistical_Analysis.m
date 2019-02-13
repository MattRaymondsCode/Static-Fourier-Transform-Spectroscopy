
%enter function (yielding scalar statistic) as a string.  Input is folder
%containing samples, the output is the Excel file

function Statistical_Analysis(f,input,output)

format long

sample_dir=dir([input '\*.csv']);

x={};


categories={'ba' 'H ' 'He' 'Hg' 'LB' 'Na' [] []; 
    '01.1' '22.1' '22.2' '22.3' '30.1' '30.2' '30.3' '31.1';
    'near zero path length' 'far from zero path length' 'off center, far from zero path length' 'centered' 'horizontal, greater' 'horizontal, less' 'vertical, greater' 'vertical, less';
    '30.2','30.3','31.1',[],[],[],[],[]};
categories_counter=ones(length(categories(:,1)),length(categories(1,:)));
categories_total=sum(~cellfun(@isempty,categories),2);

results_by_element={};
results_by_model={};
results_by_alignment={};
results_by_fixed_alignment={};

for i=1:length(sample_dir(:,1))
    
    %computes requested statistic
    
    x{i,1}=sample_dir(i,1).name;
    x{i,2}=sample_dir(i,1).name(7:18);
    [y,z]=strtok(sample_dir(i,1).name,' ');
    x{i,3}=z(3:end-5);
    if length(y)<length(x{i,1})
        x{i,4}=y(7:end);
    else
        x{i,4}=y(7:end-4);
    end    
    %%%%%% Choose incoming Matrix Size %%%%%%%%%%%%%%%%%%%%%%%%%%
    %sample=CSV_1_1_To_Matrix([input '\' sample_dir(i,1).name]);
    sample=CSV_0_0_To_Matrix([input '\' sample_dir(i,1).name]);
    x{i,5}=feval(f,sample);
    
    %organizes samples in appropriate arrays to be added to excel file
    
    for j=1:categories_total(1,1)
        if strcmp(sample_dir(i,1).name(20:21),categories{1,j})
            results_by_element{categories_counter(1,j),3*j-1}=x{i,5};
            results_by_element{categories_counter(1,j),3*j}=x{i,2};
            categories_counter(1,j)=categories_counter(1,j)+1;
            continue
        end
    end
    
    for j=1:categories_total(2,1)
        if strcmp(sample_dir(i,1).name(7:10),categories{2,j})
            results_by_model{categories_counter(2,j),3*j-1}=x{i,5};
            results_by_model{categories_counter(2,j),3*j}=x{i,4};
            categories_counter(2,j)=categories_counter(2,j)+1;
            continue
        end
    end  
    
    for j=1:categories_total(3,1)
        if strcmp(x{i,3},categories{3,j})
            results_by_alignment{categories_counter(3,j),3*j-1}=x{i,5};
            results_by_alignment{categories_counter(3,j),3*j}=x{i,4};
            categories_counter(3,j)=categories_counter(3,j)+1;
            continue
        end
    end
    
    if strcmp(x{i,3},'fixed alignment')
        for j=1:categories_total(4,1)
            if sample_dir(i,1).name(7:10)==categories{4,j}
                results_by_fixed_alignment{categories_counter(4,j),3*j-1}=x{i,5};
                results_by_fixed_alignment{categories_counter(4,j),3*j}=x{i,4};
                categories_counter(4,j)=categories_counter(4,j)+1;
                continue
            end
        end
    end
end


xlswrite(output,results_by_element,'Output','A13')
xlswrite(output,results_by_model,'Output','A50')
xlswrite(output,results_by_alignment,'Output','A100')
xlswrite(output,results_by_fixed_alignment,'Output','A127')

end
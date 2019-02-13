%Input:  Matrix

%Description:  Saves entire matrix as CSV file

%Output:  CSV file


function Matrix_To_CSV(matrix,filename)
format long
dlmwrite(filename,matrix,'precision',15);
end
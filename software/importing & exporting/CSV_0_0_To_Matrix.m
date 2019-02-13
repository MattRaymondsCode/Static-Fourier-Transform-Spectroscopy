%Input:  CSV file

%Description:  Turns entire CSV file into a matrix

%Output:  Matrix


function results=CSV_0_0_To_Matrix(y)
format long
results=dlmread(y,',',0,0);
end

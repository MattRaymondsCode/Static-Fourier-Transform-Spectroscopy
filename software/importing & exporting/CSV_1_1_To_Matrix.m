%Input:  CSV file

%Description:  Turns CSV file into a matrix- excluding the first row &
%column.

%Output:  Matrix

function results=CSV_1_1_To_Matrix(x)
format long
results=dlmread(x,',',1,1);
end
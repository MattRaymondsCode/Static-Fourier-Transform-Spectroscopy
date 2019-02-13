%Input:  Matrix (2D)

%Description:  This function takes a 2D matrix & returns a 3D matrix (equivalent to 2 matrices of the
%input size). The first matrix lists the unique values in each column, in ascending order (top row to bottom), followed by
%zeros.  The second is the relative frequency, in that column, of each value.

%Output: Matrix (3D) 


function relative_frequencies=Relative_Frequencies_C(x)

format long

relative_frequencies=zeros(length(x(:,1)),length(x(1,:)));
for i=1:length(x(1,:))
    temp=unique(x(:,i));
    for j=1:length(temp)
        relative_frequencies(j,i,1)=temp(j);
        relative_frequencies(j,i,2)=sum(x(:,i)==temp(j));
    end
end
relative_frequencies(:,:,2)=relative_frequencies(:,:,2)/length(x(:,1));

end
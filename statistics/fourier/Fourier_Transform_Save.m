function y=Fourier_Transform_Save(input,center,N,filename)

format long

temp=CSV_0_0_To_Matrix(input);

x=temp(center:N+center,1);

index='0';

%%%%%%%%%%%%%%%%%%%%     1.Range Translation    %%%%%%%%%%%%%%%%%%%%%%%%

%A.  Substract average value
x=x-Average_C(x);

%B.  Subtract 1/2 value at center
% x=x-0.5*x(1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%     2.  Apodization     %%%%%%%%%%%%%%%%%%%%%%%%%%%

%A. Linear
% for i=1:length(x)
%     x(i,1)=x(i,1)*(length(x)-i+1)/length(x);
% end

%B.  Exponential (k=1/2)
% k=1/2;
% for i=1:length(x)
%      x(i,1)=x(i,1)*exp(k*(1-i)/length(x));
% end

%C.  Exponential (k=c)
% k=3;
% for i=1:length(x)
%      x(i,1)=x(i,1)*exp(k*(1-i)/length(x));
% end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%       3.  Interpolation          %%%%%%%%%%%%%%%%%%%%

%A.  Zero-Filling (~double length)
x=vertcat(x,zeros((length(x))-1,1));

%B.  Zero-Filling (~triple length)
%x=vertcat(x,zeros(2*(length(x)-1),1));

%C.  Mirror-Imaging
%x=vertcat(x,fliplr(x(1:end-1)')');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  

M=length(x);
A=exp(-2*pi*1i/(M-1));
m=[];

for j=1:M
    for k=1:M
        m(j,k)=A^((j-1)*(k-1));
    end
end

x=m*x;

%%%%%%%%%%%%%%%%%%   4.Take real part of vector  %%%%%%%%%%%%%%%%%%%%%%%

%A.
%x=real(x);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%  5.Real or Complex Plots (then choose macro below) %%%%%%

%A.  Real Plot
y=abs(x);

%B.  Complex Plot 
%y=x;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

y=y(1:floor(length(y)/2));

%%%%%%%%%%%%%%%%%%%    6.Clipping     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%A.
% y=y(2:end);
% index='1';

%B.
%y=y(5:end);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


y=y/norm(y);

%%%%%%%%%%%%%%%%%%% Plot Macro %%%%%%%%%%%%%%%%%%%%%%%%%%

Fourier_Transform_Macro_Line_Save(y,filename,index)

%Fourier_Transform_Macro_Stem_Save(y,filename,index)

%Fourier_Transform_Macro_Complex_Save(y,filename,index)

clf
close(gcf)

end
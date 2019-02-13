%Input:  Column vector

%Description:  Estimates point of symmetry through a series of algorithms.
%This program more than not infallible!  Algorithms are described as they
%occur below.

%Output:  Number (the row number of the estimated point of symmetry).  


%Part 1:  Assuming a centerburst, this prevents identifying the point of
%symmetry in the lower 3/4 of the interval between the vector's minimum & maximum values.  This is a
%conservative estimate that was found to be necessary in practice to evade pathological results.

function y=Symmetry_Correspondence_Loss(x)
format long

bound=3*(max(x)-min(x))/4+min(x);

for i=1:length(x)
    if x(i,1)<bound
        continue
    else
        lower_bound=i;
        break
    end
end
for i=length(x):-1:1
    if x(i,1)<bound
        continue
    else
        upper_bound=i;
        break
    end
end

%Part 2:  For each point in the domain defined in part 1, a number is generated representing the sum 
%of the absolute value of the functional differences of all points equidistant from (symmetrical about) 
%that point.  The row number yielding the minimum such value is identified.  A subsequent program is 
%then required if this point is not unique.    

losses=[];

for i=lower_bound:upper_bound
    loss=0;
    interval=min([i-1 length(x)-i]);
    for j=1:interval
        loss=loss+abs(x(i-j)-x(i+j));
    end
    losses(i-lower_bound+1,1)=loss/interval;
end
[row,~]=find(losses==min(losses(:)));

%Part 3A:  The first scenario treats the case that Part 2 yielded a
%unique result.

if length(row)==1
    y=row(1,1)+lower_bound-1;

%Part 3B:  Given a non-unique result- this selects the largest measured
%value (again, based on an expected centerburst).  Of course this may not
%be unique, however this series of algorithms has proven sufficient to
%identify a unique point.  Whether or not it is the best point of symmetry
%is a different story!
    
else
    z=[];
    for i=1:length(row);
        z(i)=x(row(i));
    end
    [~, row_z]=find(z==max(z(:)));
    y=row(row_z)+lower_bound-1;
end
end

        
            
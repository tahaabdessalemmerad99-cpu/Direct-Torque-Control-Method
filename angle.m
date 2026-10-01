function y1=angle(x)
y1=0;
if x(1) >= 0 
     if  x(2)>=0
        y=atan2(x(2),x(1));
     else
        y=2*pi+atan2(x(2),x(1));
     end
else
    if  x(2)>=0
        y=atan2(x(2),x(1));
    else
        y=2*pi+atan2(x(2),x(1));
    end
end
y1=y+y1;

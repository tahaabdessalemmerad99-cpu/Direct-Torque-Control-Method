function w=dtcm4(r)
%r(1)= section
%r(2)= Flux
%r(3)= couple
v=[0 0 0;1 0 0;1 1 0;0 1 0;0 1 1;0 0 1;1 0 1;0 0 0];
v0=v(1,:);v1=v(2,:);v2=v(3,:);v3=v(4,:);v4=v(5,:);v5=v(6,:);v6=v(7,:);v7=v(8,:);
if r(2)==1 && r(3)==1
    if r(1)==1 
        w=v2;
    end
    if r(1)==2 
        w=v3;
    end
    if r(1)==3 
        w=v4;
    end
    if r(1)==4 
        w=v5;
    end
    if r(1)==5 
        w=v6;
    end
    if r(1)==6 
        w=v1;
    end
    %%%%%%%%%%%%%%%%%
elseif r(2)==1 & r(3)==-1
     if r(1)==1 
        w=v6;
    end
    if r(1)==2 
        w=v1;
    end
    if r(1)==3 
        w=v2;
    end
    if r(1)==4 
        w=v3;
    end
    if r(1)==5 
        w=v4;
    end
    if r(1)==6 
        w=v5;
    end
    %%%%%%%%%%%%%%%%%%%%%%%%
elseif r(2)==0 & r(3)==1
    if r(1)==1 
        w=v3;
    end
    if r(1)==2 
        w=v4;
    end
    if r(1)==3 
        w=v5;
    end
    if r(1)==4 
        w=v6;
    end
    if r(1)==5 
        w=v1;
    end
    if r(1)==6 
        w=v2;
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif r(2)==0 & r(3)==-1
     if r(1)==1 
        w=v5;
    end
    if r(1)==2 
        w=v6;
    end
    if r(1)==3 
        w=v1;
    end
    if r(1)==4 
        w=v2;
    end
    if r(1)==5 
        w=v3;
    end
    if r(1)==6 
        w=v4;
    end
end
%%%%%%%%%%%%%%%%%%%%%%
if r(2)==1 & r(3)==0 | r(2)==0 & r(3)==0
     if r(1)==1 
        w=v7;
    end
    if r(1)==2 
        w=v0;
    end
    if r(1)==3 
        w=v7;
    end
    if r(1)==4 
        w=v0;
    end
    if r(1)==5 
        w=v7;
    end
    if r(1)==6 
        w=v0;
    end
end
    
function H=hys1(E)
if E > 2*eps
    H=1;
end
if E < 2*eps
    if E >= 0
        H=0;
    elseif E < 0
        H=1;
    elseif E <= 0 & E > -1*eps
        H=0;
        
    end
end
    if E < -2*eps
        H=-1;
    end
end

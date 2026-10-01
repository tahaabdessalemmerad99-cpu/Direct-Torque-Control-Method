function H=hys2(E)
if E > 2*eps
    H=2;
end
if E < 2*eps
    if E > 1*eps 
        H=1;
    elseif E < 1*eps & E >= 0
        H=1;
    elseif E <= 0 & E > -1*eps
        H=-1;
    elseif E < -1*eps & E > -2*eps
        H=-1;
    elseif E < -2*eps 
        H=-2;
    end
end

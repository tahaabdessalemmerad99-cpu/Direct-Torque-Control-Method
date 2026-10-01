function y = dtcm2(x)
if abs(sin(x))< 0.5 && cos(x)>(sqrt(3)/2)
    y=1;
end
if sin(x)> 0.5 && cos(x)> 0
    y=2;
end
if sin(x)> 0.5 && cos(x)< 0
    y=3;
end
if abs(sin(x))< 0.5 && cos(x)< -sqrt(3)/2
    y=4;
end
if sin(x)< -0.5 && cos(x)< 0
    y=5;
end
if sin(x)< -0.5 && cos(x)> 0
    y=6;
end

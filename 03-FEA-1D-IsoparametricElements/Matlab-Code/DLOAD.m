function[B] = DLOAD(x)
if (x<=2)
    B = x^2;
elseif (x<=3)
    B = 10;
else 
    B = -2*x;
end

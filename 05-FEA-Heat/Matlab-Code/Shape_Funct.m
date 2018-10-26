sfunction[Nhat,DNhat] = Shape_funct(SHAPE_ORDER,r_alpha)

if (SHAPE_ORDER ==1)
    Nhat = [(1-r_alpha)/2 , (r_alpha+1)/2];
    DNhat = [-1/2,1/2];
end

if (SHAPE_ORDER ==2)
    Nhat = [(1/2)*(r_alpha-1)*r_alpha , -(r_alpha-1)*(r_alpha+1) , (1/2)*r_alpha*(r_alpha+1)];
    DNhat = [r_alpha-(1/2) , -2*r_alpha , r_alpha + (1/2)];
end

if (SHAPE_ORDER == 3)
    Nhat =[(-9/16)*(r_alpha-1)*(r_alpha-1/3)*(r_alpha+1/3),(27/16)*(r_alpha-1)*(r_alpha-1/3)*(r_alpha+1), (-27/16)*(r_alpha-1)*(r_alpha+1/3)*(r_alpha+1), (9/16)*(r_alpha-1/3)*(r_alpha+1/3)*(r_alpha+1)];
    DNhat = [(1/16)*(-27*((r_alpha)^2)+18*r_alpha+1) , (9/16)*(9*((r_alpha)^2)-2*r_alpha-3),(-9/16)*(9*((r_alpha)^2)+2*r_alpha-3), (1/16)*(27*((r_alpha)^2)+18*r_alpha-1)];
end


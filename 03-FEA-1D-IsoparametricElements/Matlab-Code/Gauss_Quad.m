function[r_alpha,w_alpha] = Gauss_Quad(NG,alpha)

if (NG==1)
    r_alpha = 0;
    w_alpha = 2;
end

if (NG ==2)
    r = [-1/sqrt(3),1/sqrt(3)];
    w = [1,1];
    r_alpha = r(alpha);
    w_alpha = w(alpha);
end

if(NG == 3)
    if (alpha == 1)
        r_alpha =  -sqrt(3/5);
        w_alpha = 5/9;
    elseif (alpha ==3)
        r_alpha = sqrt(3/5);
        w_alpha = 5/9;
    else
        r_alpha = 0;
        w_alpha = 8/9;
    end
end
%{
if (NG ==4)
    if (alpha == 1|| alpha == 4)
        r_alpha = [-sqrt((15+2*sqrt(30))/35),sqrt((15+2*sqrt(30))/35)];
        w_alpha = [49/(6*(18+sqrt(30))),49/(6*(18+sqrt(30)))];
    else
        r_alpha = [-sqrt((15-2*sqrt(30))/35),sqrt((15-2*sqrt(30))/35)];
        w_alpha = [49/(6*(18-sqrt(30))),49/(6*(18-sqrt(30)))];
    end
end
%}

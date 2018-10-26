function [bval] = DLOAD(x)

      
%      % For test problem 1 and 2      
 	if (x<=2) 
 		bval = x^2;
     elseif ( (x >= 2) && (x<=3) )
 		bval = -x;
     elseif ( (x >= 3) && (x<=4) )
 		bval = -2*x^2;
     elseif ( (x >= 6) && (x<=7) )
 		bval = x;
     end 
    
end

function [Eval] = UMAT(x)


    
% % For test problem 1 and 2
     if (x<=2) 
 		Eval = 20*x;
     elseif ( (x >= 4) && (x<=7) )
 		Eval = 10*x+20;
     end
 	

end

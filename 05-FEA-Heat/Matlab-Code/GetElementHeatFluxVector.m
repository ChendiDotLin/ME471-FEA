function [flux,gradT] = GetElementHeatFluxVector(I_ELEM, NNODE_ELE, DOF_NODE, ...
            NDIM, COORDS, ELEM_NODE, ELEM_STIFF, ShapeOrder , Ng, location, UUR)

		%You need to complete this function. Note that in order to evaluate the flux, you need
		%to calculate flux(r) = -[k]*[Bhat(r)]*{T}. Note that this follows the same format used to determine %the conductivity matrix. [Bhat(r)]'*[k]*[Bhat(r)].
		
		%When location is 1, evaluate the flux at the gauss points (and hence flux will be a 2x4 matrix)
		%When location is 0, evaluate the flux at the centroid (r = [0,0], and hence the flux is a 2x1 matrix) 
			
			
uel = zeros(NNODE_ELE*DOF_NODE,1);
xel = zeros(NDIM,NNODE_ELE);


for i=1:NNODE_ELE
    uel(i,1) = UUR(ELEM_NODE(i,I_ELEM),1);
    for j=1:NDIM        
        xel(j,i) = COORDS(ELEM_NODE(i,I_ELEM),j);
    end
end

if location == 1
    %% Evaluating flux at guass points (same used to obtain field approximation    
    %flux = -kmat*Bhat*uel; for each gauss point
	%gradT = Bhat*uel; for each gauss point
    flux = zeros(2,4);
    gradT = zeros(2,4);
    for i = 1:Ng
        [r1,w1] =Gauss_Quad(Ng,i);
        for j = 1:Ng
            [r2,w2] = Gauss_Quad(Ng,j);
            rvec = [r1,r2];
            [Nhat,DNhat] = Quad2DShapeFunctions(rvec,ShapeOrder);
            J = xel*transpose(DNhat);
            k = [ELEM_STIFF(I_ELEM,1),0;0,ELEM_STIFF(I_ELEM,2)]
            B = (inv(transpose(J)))*DNhat
            uel
            flux(:,2*(i-1)+j) =flux(:,2*(i-1)+j)-(k*B*uel);
            gradT(:,2*(i-1)+j) = gradT(:,2*(i-1)+j)+(B*uel);
        end
    end
end

if location == 0 
    %% Evaluating flux at the center of isoparametric element 
    %flux = -kmat*Bhat*uel; for the centroid
	%gradT = Bhat*uel;  for the centroid
    flux = zeros(2,1);
    gradT = zeros(2,1);
    rvec = [0,0];
    [Nhat,DNhat] = Quad2DShapeFunctions(rvec,ShapeOrder);
    J = xel*transpose(DNhat);
    k = [ELEM_STIFF(I_ELEM,1),0;0,ELEM_STIFF(I_ELEM,2)];
    B = (inv(transpose(J)))*DNhat;
    flux = flux-(k*B*uel);
    gradT = gradT+(B*uel);
end
   
end
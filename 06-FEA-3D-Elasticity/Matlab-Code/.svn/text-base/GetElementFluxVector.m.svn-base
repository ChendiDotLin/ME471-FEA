function [stress, strain] = GetElementFluxVector(I_ELEM, NNODE_ELE, DOF_NODE, ...
            NDIM, COORDS, ELEM_NODE, ELEM_STIFF, ShapeOrder , Ng, ... 
            Model2D,  location, UUR)

E = ELEM_STIFF(I_ELEM,1);
v = ELEM_STIFF(I_ELEM,2);
if (Model2D==1)
    MATC = (E/(1-v^2))*[1,0,0,v;0,(1-v)/2,(1-v)/2,0;0,(1-v)/2,(1-v)/2,0;v,0,0,1];
end

if (Model2D ==2)
    MATC = (E/((1+v)*(1-2*v)))*[1-v,0,0,v;0,(1-2*v)/2,(1-2*v)/2,0;0,(1-2*v)/2,(1-2*v)/2,0;v,0,0,1-v];
end
uel = zeros(NNODE_ELE*DOF_NODE,1);
xel = zeros(NDIM,NNODE_ELE);


for i=1:NNODE_ELE
    for j =1:2
        uel(2*(i-1)+j,1) = UUR(ELEM_NODE(i,I_ELEM),j);
    end
    for j=1:NDIM        
        xel(j,i) = COORDS(ELEM_NODE(i,I_ELEM),j);
    end
end

if location == 1
    %% Evaluating flux at guass points (same used to obtain field approximation
    stress = zeros(4,4);
    strain = zeros(4,4);
    for i = 1:Ng
        [r1,w1] =Gauss_Quad(Ng,i);
        for j = 1:Ng
            [r2,w2] = Gauss_Quad(Ng,j);
            rvec = [r1,r2];
            [Nhat,DNhat] = Quad2DShapeFunctions(rvec,ShapeOrder);
            J = xel*transpose(DNhat);
 
            B = (inv(transpose(J)))*DNhat;
            I = eye(2);
            strain(:,2*(i-1)+j) = strain(:,2*(i-1)+j)+(kron(B,I))*uel;
            stress(:,2*(i-1)+j) = stress(:,2*(i-1)+j)+MATC*(kron(B,I))*uel;
        end
    end
end

if location == 0 
    %% Evaluating flux at the center of isoparametric element
	stress = zeros(4,1);
    strain = zeros(4,1);
    rvec = [0,0];
    [Nhat,DNhat] = Quad2DShapeFunctions(rvec,ShapeOrder);
    J = xel*transpose(DNhat);
    B = (inv(transpose(J)))*DNhat;
    I = eye(2);
    strain = strain+(kron(B,I))*uel;
    stress = stress +MATC*(kron(B,I))*uel;
    
end
   
end
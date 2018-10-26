function[KEL,PEL] = ElementSurfaceTraction(m,betaP,betaK,Ng,COORDS,ELEM_NODE,ShapeOrder,KEL,PEL,NNODE_ELE,TRAC_ELE)

ielem = TRAC_ELE(m,1);
face = TRAC_ELE(m,2);

for i = 1:Ng
    [r,w] = Gauss_Quad(Ng,i);
    switch(face)
    case 1
        nh = [0;-1];
        rvec = [r -1];
    case 2
        nh = [1;0];
        rvec =[1 r];
    case 3
        nh = [0;1];
        rvec = [r 1];
    case 4
        nh = [-1;0];
        rvec = [-1 r];
    end
    
    [Nhat,DNhat] = Quad2DShapeFunctions(rvec,ShapeOrder)
    X = zeros(2,4);
        for j=1:4
            NODE = ELEM_NODE(j,ielem);
            X(1,j) = COORDS(NODE,1);
            X(2,j) = COORDS(NODE,2);
        end
    J = X*transpose(DNhat);
    PEL = PEL+transpose(Nhat)*betaP*det(J)*norm(inv(transpose(J))*nh)*w;
    NC = transpose(Nhat)*Nhat;
    for k = 1:NNODE_ELE
        NL(k,k) = sum(NC(k,:));
    end
    
    KEL = KEL+betaK*NL*det(J)*norm(inv(transpose(J))*nh)*w;
end

    



function[KEL,PEL] = ELementAssembleHeatTransfer(I_ELEM,ELEM_STIFF,ELEM_LOAD,ELEM_NODE,COORDS,Ng,ShapeOrder,KEL,PEL)

X = zeros(2,4);
for i=1:4
    NODE = ELEM_NODE(i,I_ELEM);
    X(1,i) = COORDS(NODE,1);
    X(2,i) = COORDS(NODE,2);
end
X

for i = 1:Ng
    [r1,w1] =Gauss_Quad(Ng,i);
    for j = 1:Ng
        [r2,w2] = Gauss_Quad(Ng,j);
        rvec = [r1,r2];
        [Nhat,DNhat] = Quad2DShapeFunctions(rvec,ShapeOrder);
        J = X*transpose(DNhat);
        k = [ELEM_STIFF(I_ELEM,1),0;0,ELEM_STIFF(I_ELEM,2)];
        B = (inv(transpose(J)))*DNhat;
        KEL = KEL+transpose(B)*k*B*det(J)*w1*w2;
        PEL = PEL+ transpose(Nhat)*ELEM_LOAD(I_ELEM,2)*det(J)*w1*w2;
    end
end


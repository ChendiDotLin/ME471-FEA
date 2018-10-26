function[KEL,PEL] = ELementAssemble(I_ELEM,ELEM_STIFF,ELEM_LOAD,ELEM_NODE,COORDS,Ng,ShapeOrder,KEL,PEL,Model2D)
E = ELEM_STIFF(I_ELEM,1);
v = ELEM_STIFF(I_ELEM,2);
if (Model2D==1)
    MATC = (E/(1-v^2))*[1,0,0,v;0,(1-v)/2,(1-v)/2,0;0,(1-v)/2,(1-v)/2,0;v,0,0,1];
end

if (Model2D ==2)
    MATC = (E/((1+v)*(1-2*v)))*[1-v,0,0,v;0,(1-2*v)/2,(1-2*v)/2,0;0,(1-2*v)/2,(1-2*v)/2,0;v,0,0,1-v];
end

X = zeros(2,4);
for i=1:4
    NODE = ELEM_NODE(i,I_ELEM);
    X(1,i) = COORDS(NODE,1);
    X(2,i) = COORDS(NODE,2);
end



for i = 1:Ng
    [r1,w1] =Gauss_Quad(Ng,i);
    for j = 1:Ng
        [r2,w2] = Gauss_Quad(Ng,j);
        rvec = [r1,r2];
        [Nhat,DNhat] = Quad2DShapeFunctions(rvec,ShapeOrder);
        J = X*transpose(DNhat);
        B = (inv(transpose(J)))*DNhat;
        I = eye(2);
        NOI = kron(Nhat,I);
        BOI = kron(B,I);
       
        KEL = KEL+transpose(BOI)*MATC*BOI*det(J)*w1*w2;
        
        PEL = PEL+ transpose(NOI)*[ELEM_LOAD(I_ELEM,1);ELEM_LOAD(I_ELEM,2)]*det(J)*w1*w2;
    end
end


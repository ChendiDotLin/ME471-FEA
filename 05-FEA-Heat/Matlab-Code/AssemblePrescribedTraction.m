
function[PP,PF,KPP,KPF,KFP,KFF] = AssemblePrescribedTraction(TRAC_c_ELE,TRAC_c_VAL,TRAC_q_ELE,TRAC_q_VAL,N_TRAC_c,N_TRAC_q,Ng,PP,PF,KFF,KFP,KPF,KPP,EQ_NUM,COORDS,ELEM_NODE,ShapeOrder,NNODE_ELE)
for m =1:N_TRAC_c
    KEL = zeros(NNODE_ELE,NNODE_ELE);
    PEL = zeros(NNODE_ELE,1);

    I_ELEM = TRAC_c_ELE(m,1);
    betaP = TRAC_c_VAL(m,1)*TRAC_c_VAL(m,2);
    betaK = TRAC_c_VAL(m,1);

    [KEL,PEL] = ElementSurfaceTraction(m,betaP,betaK,Ng,COORDS,ELEM_NODE,ShapeOrder,KEL,PEL,NNODE_ELE,TRAC_c_ELE);
    [PP,PF,KPP,KPF,KFP,KFF] = AssembleGlobal(I_ELEM,KEL,PEL,PP,PF,KFF,KFP,KPF,KPP,EQ_NUM,NNODE_ELE,ELEM_NODE);
end

for m = 1:N_TRAC_q
    KEL = zeros(NNODE_ELE,NNODE_ELE);
    PEL = zeros(NNODE_ELE,1);

    I_ELEM = TRAC_q_ELE(m,1);
    betaP  = -TRAC_q_VAL(m,1);
    [KEL,PEL] = ElementSurfaceTraction(m,betaP,0,Ng,COORDS,ELEM_NODE,ShapeOrder,KEL,PEL,NNODE_ELE,TRAC_q_ELE);
    [PP,PF,KPP,KPF,KFP,KFF] = AssembleGlobal(I_ELEM,KEL,PEL,PP,PF,KFF,KFP,KPF,KPP,EQ_NUM,NNODE_ELE,ELEM_NODE);
end



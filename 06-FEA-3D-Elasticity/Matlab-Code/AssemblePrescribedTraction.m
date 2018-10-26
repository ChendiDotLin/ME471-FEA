
function[PP,PF,KPP,KPF,KFP,KFF] = AssemblePrescribedTraction(TRAC_ELE,TRAC_VAL,N_TRAC,Ng,PP,PF,KFF,KFP,KPF,KPP,EQ_NUM,COORDS,ELEM_NODE,ShapeOrder,NNODE_ELE,EDOF)
for m =1:N_TRAC
    KEL = zeros(EDOF,EDOF);
    PEL = zeros(EDOF,1);
    
    
    tp = TRAC_VAL(m,1)*[TRAC_VAL(m,2);TRAC_VAL(m,3)];
    I_ELEM = TRAC_ELE(m,1);
    
    
    [KEL,PEL] = ElementSurfaceTraction(m,Ng,COORDS,ELEM_NODE,ShapeOrder,KEL,PEL,NNODE_ELE,TRAC_ELE,tp);
    PEL
    [PP,PF,KPP,KPF,KFP,KFF] = AssembleGlobal(I_ELEM,KEL,PEL,PP,PF,KFF,KFP,KPF,KPP,EQ_NUM,NNODE_ELE,ELEM_NODE);
end

function[KPP,KPF,KFF,KFP,PP,PF,UP] = Assemble(COORDS,N_ELEM,N_LOAD,N_PRE_DISP,ELEM_LOAD,ELEM_NODE,...
ELEM_STIFF,ELEM_AREA,FORCE_NODE,FORCE_VAL,DISP_NODE,DISP_VAL,N_TRAC,TRAC_ELE,TRAC_VAL,...
NNODE_ELE,N_DOF,Ng,ShapeOrder,EQ_NUM,material,EDOF,Model2D)
 

    
%displacement
UP = zeros(N_PRE_DISP,1);
for i = 1:N_PRE_DISP
    NODE = DISP_NODE(i,1);
    DOF = DISP_NODE(i,2);

    u = DISP_VAL(i);
    ROW = -(EQ_NUM(NODE,DOF));
    UP(ROW) = u;
end

%force 
PF = zeros(N_DOF,1);
for i = 1:N_LOAD
    NODE = FORCE_NODE(i,1);
    DOF = FORCE_NODE(i,2);
    f = FORCE_VAL(i);
    ROW = EQ_NUM(NODE,DOF);
    if (ROW>0)
        PF(ROW) = PF(ROW)+f;
    end
end

PP = zeros(N_PRE_DISP,1)
KPP = zeros(N_PRE_DISP,N_PRE_DISP);
KPF = zeros(N_PRE_DISP,N_DOF);
KFP = zeros(N_DOF,N_PRE_DISP);
KFF = zeros(N_DOF,N_DOF);


[PP,PF,KPP,KPF,KFP,KFF] = AssemblePrescribedTraction(TRAC_ELE,TRAC_VAL,N_TRAC,Ng,PP,PF,KFF,KFP,KPF,KPP,EQ_NUM,COORDS,ELEM_NODE,ShapeOrder,NNODE_ELE,EDOF);
PF
PP
%Global stiffness
for I_ELEM = 1:N_ELEM
    KEL = zeros(EDOF,EDOF);
    PEL = zeros(EDOF,1);

    [KEL,PEL] = ElementAssemble(I_ELEM,ELEM_STIFF,ELEM_LOAD,ELEM_NODE,COORDS,Ng,ShapeOrder,KEL,PEL,Model2D);
    KEL
    [PP,PF,KPP,KPF,KFP,KFF] = AssembleGlobal(I_ELEM,KEL,PEL,PP,PF,KFF,KFP,KPF,KPP,EQ_NUM,NNODE_ELE,ELEM_NODE);
end

 

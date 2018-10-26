function[KPP,KPF,KFF,KFP,PP,PF,UP] = Assemble(COORDS,N_ELEM,N_LOAD,N_PRE_DISP,ELEM_LOAD,ELEM_NODE,...
ELEM_STIFF,ELEM_AREA,FORCE_NODE,FORCE_VAL,DISP_NODE,DISP_VAL,N_TRAC_c,TRAC_c_ELE,TRAC_c_VAL,N_TRAC_q,TRAC_q_ELE,TRAC_q_VAL,...
NNODE_ELE,N_DOF,Ng,ShapeOrder,EQ_NUM)

%displacement
UP = zeros(N_PRE_DISP,1);
for i = 1:N_PRE_DISP
    NODE = DISP_NODE(i);
    u = DISP_VAL(i);
    ROW = -(EQ_NUM(NODE));
    UP(ROW) = u;
end

%force 
PF = zeros(N_DOF,1);
for i = 1:N_LOAD
    NODE = FORCE_NODE(i);
    f = FORCE_VAL(i);
    ROW = EQ_NUM(NODE);
    if (ROW>0)
        PF(ROW) = PF(ROW)+f;
    end
end

PP = zeros(N_PRE_DISP,1);
KPP = zeros(N_PRE_DISP,N_PRE_DISP);
KPF = zeros(N_PRE_DISP,N_DOF);
KFP = zeros(N_DOF,N_PRE_DISP);
KFF = zeros(N_DOF,N_DOF);


[PP,PF,KPP,KPF,KFP,KFF] = AssemblePrescribedTraction(TRAC_c_ELE,TRAC_c_VAL,TRAC_q_ELE,TRAC_q_VAL,N_TRAC_c,N_TRAC_q,Ng,PP,PF,KFF,KFP,KPF,KPP,EQ_NUM,COORDS,ELEM_NODE,ShapeOrder,NNODE_ELE);

%Global stiffness
for I_ELEM = 1:N_ELEM
    KEL = zeros(NNODE_ELE,NNODE_ELE);
    PEL = zeros(NNODE_ELE,1);

    [KEL,PEL] = ElementAssembleHeatTransfer(I_ELEM,ELEM_STIFF,ELEM_LOAD,ELEM_NODE,COORDS,Ng,ShapeOrder,KEL,PEL);

    [PP,PF,KPP,KPF,KFP,KFF] = AssembleGlobal(I_ELEM,KEL,PEL,PP,PF,KFF,KFP,KPF,KPP,EQ_NUM,NNODE_ELE,ELEM_NODE);
end

 

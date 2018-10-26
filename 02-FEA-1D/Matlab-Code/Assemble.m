function[KPP,KPF,KFF,KFP,PP,PF,UP]= Assemble(COORDS,N_ELEM,N_LOAD,N_PRE_DISP,ELEM_NODE,ELEM_STIFF,ELEM_LOAD,LOAD_NODE,LOAD_VAL,DISP_NODE,DISP_VAL,EQ_NUM,N_DOF)

%displacement assemble
UP = zeros(N_PRE_DISP,1);
for i = 1:N_PRE_DISP
    NODE = DISP_NODE(i);
    u = DISP_VAL(i);
    ROW = -(EQ_NUM(NODE));
    UP(ROW) = u;
end

%force assemble
PF = zeros(N_DOF,1)
for i = 1:N_LOAD
    NODE = LOAD_NODE(i);
    f = LOAD_VAL(i);
    ROW = EQ_NUM(NODE);
    if(ROW>0)
        PF(ROW) = PF(ROW)+f;
    end
end
PP = zeros(N_PRE_DISP,1);

KPP = zeros(N_PRE_DISP,N_PRE_DISP);
KPF = zeros(N_PRE_DISP,N_DOF);
KFF = zeros(N_DOF,N_DOF);
KFP = zeros(N_DOF,N_PRE_DISP);

for ELEM_NUM = 1:N_ELEM
    %FIND KEL,PEL
    hi = COORDS(ELEM_NUM+1)-COORDS(ELEM_NUM);
    KEL = (ELEM_STIFF(ELEM_NUM)/hi)*[1,-1;-1,1];
    PEL = (ELEM_LOAD(ELEM_NUM)*hi/2)*[1;1];
    
    %update KPP,KPF,KFF,KFP,PP,PF
    for i = 1:2
        I_NODE = ELEM_NODE(i,ELEM_NUM);
        ROW = EQ_NUM(I_NODE);
        if (ROW<0)
            PP(-ROW) = PP(-ROW)+ PEL(i) ;
        end
        if (ROW>0)
            PF(ROW) = PF(ROW) + PEL(i);
        end
        for j = 1:2
            J_NODE = ELEM_NODE(j,ELEM_NUM);
            COL = EQ_NUM(J_NODE);
            if (ROW >0)
                if (COL>0)
                    KFF(ROW,COL) = KFF(ROW,COL)+KEL(i,j);
                else
                    KFP(ROW,-COL) = KFP(ROW,-COL)+KEL(i,j);
                end
            else
                if(COL>0)
                    KPF(-ROW,COL) = KPF(-ROW,COL)+KEL(i,j);
                else
                    KPP(-ROW,-COL) = KPP(-ROW,-COL)+KEL(i,j);
                end
            end
        end
    end
end

        
            




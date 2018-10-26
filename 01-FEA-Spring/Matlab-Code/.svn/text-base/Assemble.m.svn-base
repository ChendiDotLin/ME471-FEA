function[KPP,KPF,KFF,KFP,PF,UP] = Assemble(N_ELEM,N_LOAD,N_PRE_DISP,ELEM_NODE,ELEM_STIFF,FORCE_NODE,FORCE_VAL,DISP_NODE,DISP_VAL,EQ_NUM,N_DOF)

%displacement assemble
UP = zeros(N_PRE_DISP,1);
for i = 1:N_PRE_DISP
    NODE = DISP_NODE(i);
    u = DISP_VAL(i);
    ROW = -(EQ_NUM(NODE));
    UP(ROW) = u;
end
UP
%force assemble
PF = zeros(N_DOF,1)
for i = 1:N_LOAD
    NODE = FORCE_NODE (i);
    f = FORCE_VAL(i);
    ROW = EQ_NUM(NODE);
    if(ROW > 0)
        PF(ROW) = PF(ROW)+f;
    end
end

KPP = zeros(N_PRE_DISP,N_PRE_DISP);
KPF = zeros(N_PRE_DISP,N_DOF);
KFF = zeros(N_DOF,N_DOF);
KFP = zeros(N_DOF,N_PRE_DISP);

for ELEM_NUM = 1:N_ELEM
    %find KEL
    k = ELEM_STIFF(ELEM_NUM);
    KEL = k*[1,-1;-1,1];
    %update KPP,KPF,KFF,KFP
    for i  = 1:2
        I_NODE = ELEM_NODE(i,ELEM_NUM);
        ROW =EQ_NUM(I_NODE);
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



function[KPP,KPF,KFF,KFP,PP,PF,UP]= Assemble(COORDS,N_ELEM,N_LOAD,N_PRE_DISP,NG,SHAPE_ORDER,ELEM_NODE,ELEM_STIFF,ELEM_LOAD,FORCE_NODE,FORCE_VAL,DISP_NODE,DISP_VAL,EQ_NUM,N_DOF,NNODE_ELE)

%displacement assemble
UP = zeros(N_PRE_DISP,1);
for i = 1:N_PRE_DISP
    NODE = DISP_NODE(i);
    u = DISP_VAL(i);
    ROW = -(EQ_NUM(NODE));
    UP(ROW) = u;
end

%force assemble
PF = zeros(N_DOF,1);
for i = 1:N_LOAD
    NODE = FORCE_NODE(i);
    f = FORCE_VAL(i);
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
    %find XEL
    XEL = zeros(NNODE_ELE,1);
    for l = 1:NNODE_ELE
        NODE = ELEM_NODE(l,ELEM_NUM);
        XEL(l) = COORDS(NODE);
    end
    XEL
    %find KEL PEL
    KEL = zeros(NNODE_ELE,NNODE_ELE);
    PEL = zeros(NNODE_ELE,1);
    for alpha = 1:NG
        %compute Guass Quad and Shape Func
        [r_alpha,w_alpha] = Gauss_Quad(NG,alpha)
        [Nhat,DNhat] = Shape_Funct(SHAPE_ORDER,r_alpha)
        E = ELEM_STIFF(ELEM_NUM)
        if (imag(E) == 1)
            x = Nhat*XEL
            E = UMAT(x)
        end
        B = ELEM_LOAD(ELEM_NUM);
        if (imag(B) == 1)
            x = Nhat * XEL
            B = DLOAD(x)
        end

        J = DNhat *XEL
        Bhat = DNhat *inv([J])
        KEL = KEL + transpose(Bhat) *E* Bhat * J * w_alpha
        PEL = PEL + transpose(Nhat) *B * J * w_alpha
    end

    % update KPP,KPF,KFF,KFP,PP,PF
    for i = 1:NNODE_ELE
        I_NODE = ELEM_NODE(i,ELEM_NUM);
        ROW = EQ_NUM(I_NODE);
        if (ROW<0)
            PP(-ROW) = PP(-ROW)+PEL(i);
        end
        if (ROW>0)
            PF(ROW) = PF(ROW) + PEL(i);
        end

        for j = 1: NNODE_ELE
            J_NODE = ELEM_NODE(j,ELEM_NUM);
            COL = EQ_NUM(J_NODE);
            if (ROW > 0)
                if (COL>0)
                    KFF(ROW,COL) = KFF(ROW,COL)+KEL(i,j);
                else
                    KFP(ROW,-COL) = KFP(ROW,-COL)+KEL(i,j);
                end
            else
                if(COL>0)
                    KPF(-ROW,COL) = KPF(-ROW,COL)+KEL(i,j);
                else
                    KPP(-ROW,-COL) = KPP(-ROW,-COL) + KEL(i,j);
                end
            end
        end
    end
end

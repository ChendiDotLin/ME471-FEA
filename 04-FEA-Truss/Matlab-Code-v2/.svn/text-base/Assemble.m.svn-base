function[KPP,KPF,KFF,KFP,PP,PF,UP] = Assemble(COORDS,N_ELEM,N_LOAD,N_PRE_DISP,ELEM_NODE,ELEM_STIFF,ELEM_AREA,ELEM_LOAD,FORCE_NODE,FORCE_VAL,DISP_NODE,DISP_VAL,EQ_NUM,N_DOF)

UP = zeros(N_PRE_DISP,1);
for i = 1:N_PRE_DISP
    NODE = DISP_NODE(i,1);
    DOF = DISP_NODE(i,2);
    u = DISP_VAL(i);
    ROW = -(EQ_NUM(NODE,DOF));
    UP(ROW) = u;
end

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
PP = zeros(N_PRE_DISP,1);

KPP = zeros(N_PRE_DISP,N_PRE_DISP);
KPF = zeros(N_PRE_DISP,N_DOF);
KFF = zeros(N_DOF,N_DOF);
KFP = zeros(N_DOF,N_PRE_DISP);

for ELEM_NUM =1 : N_ELEM
    %FIND KEL PEL
    E = ELEM_STIFF(ELEM_NUM,1);
    alpha = ELEM_STIFF(ELEM_NUM,2);
    A = ELEM_AREA(ELEM_NUM);
    a = ELEM_NODE(1,ELEM_NUM);
    b = ELEM_NODE(2,ELEM_NUM);
    ax = COORDS(a,1);
    ay = COORDS(a,2);
    bx = COORDS(b,1);
    by = COORDS(b,2);
    L = sqrt((ax-bx)^2 + (ay-by)^2);
    theta = atan2(by-ay,bx-ax);
    c = cos(theta);
    s = sin(theta);
    KEL = E*A/L*[c^2,c*s,-c^2,-c*s;c*s,s^2,-c*s,-s^2;-c^2,-c*s,c^2,c*s;-c*s,-s^2,c*s,s^2];
    PEL = [-ELEM_LOAD(ELEM_NUM,2)*ELEM_STIFF(ELEM_NUM,2)*E*c*A;-ELEM_LOAD(ELEM_NUM,2)*ELEM_STIFF(ELEM_NUM,2)*E*s*A-1/2*(ELEM_LOAD(ELEM_NUM,1)*A*L);ELEM_LOAD(ELEM_NUM,2)*ELEM_STIFF(ELEM_NUM,2)*E*c*A;ELEM_LOAD(ELEM_NUM,2)*ELEM_STIFF(ELEM_NUM,2)*E*s*A-1/2*(ELEM_LOAD(ELEM_NUM,1)*A*L)]

    for i = 1:2
        %first node
        I_NODE = ELEM_NODE(i,ELEM_NUM);
        for j = 1:2
            ROW = EQ_NUM(I_NODE,j);
            if(ROW < 0)
                PP(-ROW) = PP(-ROW)+PEL(2*(i-1)+j)
            end
            if(ROW >0)
                PF(ROW) = PF(ROW)+PEL(2*(i-1)+j);
            end
        end
        %%K
        for j = 1:2
            %second node
            J_NODE = ELEM_NODE(j,ELEM_NUM);
            for k = 1:2
                %first coor
                for l = 1:2
                    %second coor
                    ROW = EQ_NUM(I_NODE,k);
                    COL = EQ_NUM(J_NODE,l);
                    if (ROW>0)
                        if (COL>0)
                            KFF(ROW,COL) = KFF(ROW,COL)+KEL(2*(i-1)+k,2*(j-1)+l);
                        else
                            KFP(ROW,-COL) = KFP(ROW,-COL)+KEL(2*(i-1)+k,2*(j-1)+l);
                        end
                    else
                        if(COL>0)
                            KPF(-ROW,COL) = KPF(-ROW,COL)+KEL(2*(i-1)+k,2*(j-1)+l);
                        else
                            KPP(-ROW,-COL) = KPP(-ROW,-COL)+KEL(2*(i-1)+k,2*(j-1)+l);
                        end
                    end
                end
            end
        end
    end
end



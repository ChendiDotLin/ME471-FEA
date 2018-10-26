function [PP,PF,KPP,KPF,KFP,KFF] = AssembleGlobal(I_ELEM,KEL,PEL,PP,PF,KFF,KFP,KPF,KPP,EQ_NUM,NNODE_ELE,ELEM_NODE)
for i = 1:NNODE_ELE
	I_NODE = ELEM_NODE(i,I_ELEM);
        ROW = EQ_NUM(I_NODE);
        if (ROW<0)
            PP(-ROW) = PP(-ROW)+PEL(i);
        end
        if (ROW>0)
            PF(ROW) = PF(ROW) + PEL(i);
        end

        for j = 1: NNODE_ELE
            J_NODE = ELEM_NODE(j,I_ELEM);
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


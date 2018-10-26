function [PP,PF,KPP,KPF,KFP,KFF] = AssembleGlobal(I_ELEM,KEL,PEL,PP,PF,KFF,KFP,KPF,KPP,EQ_NUM,NNODE_ELE,ELEM_NODE)
for i = 1:NNODE_ELE
        %first node
    I_NODE = ELEM_NODE(i,I_ELEM);
        for j = 1:2
        ROW = EQ_NUM(I_NODE,j)
            if(ROW < 0)
                PP(-ROW) = PP(-ROW)+PEL(2*(i-1)+j);
            end
            if(ROW >0)
                PF(ROW) = PF(ROW)+PEL(2*(i-1)+j);
            end
        end
        %%K
    for j = 1:NNODE_ELE
        %second node
        J_NODE = ELEM_NODE(j,I_ELEM);
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
function[UUR,PUR,UF,PP] = Solve(N_NODE,KPP,KPF,KFF,KFP,PP,PF,UP,EQ_NUM)

UF = KFF\(PF-KFP*UP)
PP = KPP*UP+KPF*UF-PP
for i = 1:N_NODE
    for j = 1 :2
        ROW = EQ_NUM(i,j);
        if (ROW>0)
            UUR(i,j) =UF(ROW);
            PUR(i,j) = PF(ROW);
        else
            UUR(i,j) = UP(-ROW);
            PUR(i,j) = PP(-ROW);
        end
    end 
end

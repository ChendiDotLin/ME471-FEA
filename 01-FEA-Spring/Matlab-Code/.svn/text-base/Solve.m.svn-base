function[UUR,PUR,UF,PP] = Solve(N_NODE,KPP,KPF,KFF,KFP,PF,UP,EQ_NUM)
UF = KFF\(PF-KFP*UP);
PP = KPP*UP+KPF*UF;
for i = 1:N_NODE
    ROW = EQ_NUM(i);
    if (ROW>0) 
        UUR(i) = UF(ROW);
        PUR(i) = PF(ROW);
    else
        UUR(i) = UP(-ROW);
        PUR(i) = PP(-ROW);
    end
end


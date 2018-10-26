function[EQ_NUM,N_DOF] = Initialize(N_NODE,N_PRE_DISP,DISP_NODE)
EQ_NUM = zeros(N_NODE,1);
for i = 1:N_PRE_DISP
    NODE = DISP_NODE(i);
    EQ_NUM(NODE) = -i;
end

ROW = 0;
for i = 1:N_NODE
    if (EQ_NUM(i) ==0)
        ROW = ROW+1;
        EQ_NUM (i) = ROW;
    end
end

N_DOF = N_NODE-N_PRE_DISP;

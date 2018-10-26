function[strain,stress] = Calc(UUR,ELEM_STIFF,COORDS,N_ELEM,ELEM_LOAD,ELEM_NODE)
strain = zeros(N_ELEM,1);
stress = zeros(N_ELEM,1);
for i = 1:N_ELEM
    ANODE = ELEM_NODE(1,i);
    BNODE = ELEM_NODE(2,i);
    AX = UUR(ANODE,1);
    AY = UUR(ANODE,2);
    BX = UUR(BNODE,1);
    BY = UUR(BNODE,2);
    ax = COORDS(ANODE,1);
    ay = COORDS(ANODE,2);
    bx = COORDS(BNODE,1);
    by = COORDS(BNODE,2);
    L = sqrt((ax-bx)^2 + (ay-by)^2);
    theta = atan2(by-ay,bx-ax);
    c = cos(theta);
    s = sin(theta);
    U = [c,s,0,0;0,0,c,s]*[AX;AY;BX;BY];
    strain(i) = (U(2)-U(1))/L;
    stress(i) = ELEM_STIFF(i,1)*(strain(i)-ELEM_STIFF(i,2)*ELEM_LOAD(i,2));
end


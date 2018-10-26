function [COORDS,N_NODE,N_ELEM,N_LOAD,N_PRE_DISP,...
    ELEM_NODE,ELEM_STIFF,...
    ELEM_LOAD,LOAD_NODE,LOAD_VAL,DISP_NODE,DISP_VAL] = ReadInput(filen,nnode_ele)
%Open input file
fid  = fopen(filen,'r');
A = fscanf(fid,'%f');

%read first line
N_NODE = A(1);
N_ELEM = A(2);
N_LOAD = A(3);
N_PRE_DISP = A(4);


%initialize vectors
COORDS = zeros(N_NODE,1);
ELEM_NODE = zeros(nnode_ele,N_ELEM);
ELEM_STIFF = zeros(N_ELEM,1);
ELEM_LOAD = zeros(N_ELEM,1);
LOAD_NODE = zeros(N_LOAD,1);
LOAD_VAL  = zeros(N_LOAD,1);


DISP_NODE = zeros(N_PRE_DISP,1);
DISP_VAL = zeros(N_PRE_DISP,1);

count = 5;
%getting numbers for coords
for i = 1:N_NODE
    COORDS(i,1) = A(count);
    count = count+1;
end

%elem and elem stiffness
for i = 1: N_ELEM
    ELEM_NODE (1,i) = A(count);
    count = count+1;
    ELEM_NODE(2,i) = A(count);
    count = count+1;
    hi = COORDS(i+1)-COORDS(i);
    E = inte(A(count),COORDS(i),COORDS(i+1));
    count = count+1;
    B = inte(A(count),COORDS(i),COORDS(i+1));
    count = count+1;
    ELEM_STIFF(i,1) = E/hi;
    ELEM_LOAD(i,1) = B/hi;
end

%load
if(N_LOAD>0)
    for i = 1: N_LOAD
        LOAD_NODE(i,1) = A(count);
        LOAD_VAL(i,1) = A(count+1);
        count = count+2;
    end
end

%displacement
for i = 1:N_PRE_DISP
    DISP_NODE(i,1) = A(count);
    DISP_VAL(i,1) = A(count+1);
    count = count+2;
end

fclose(fid);
end





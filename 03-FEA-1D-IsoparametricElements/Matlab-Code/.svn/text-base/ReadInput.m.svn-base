function[COORDS,N_NODE,N_ELEM,N_LOAD,N_PRE_DISP,NG,SHAPE_ORDER,...
NNODE_ELE,DOF_NODE,EDOF,...
ELEM_NODE,ELEM_STIFF,...
ELEM_LOAD,FORCE_NODE,FORCE_VAL,DISP_NODE,DISP_VAL] = ReadInput(filen,nnode_ele)
%Open input file
fid = fopen(filen,'r');
%something should be fixed here
A = fscanf(fid,'%f',6);
A

%read first line
N_NODE = A(1)
N_ELEM = A(2)
N_LOAD = A(3)
N_PRE_DISP = A(4)
NG = A(5)
SHAPE_ORDER = A(6)
if (SHAPE_ORDER<=3)
    NNODE_ELE = SHAPE_ORDER+1;
else
    disp('Only linear, quadratic and cubic functions are implemented.');return;
end

if(NG>4)
    disp('Max Ng =4');return;
end

DOF_NODE = 1;%NUMBER OF DEGREES OF FREEDOM PER NODE
EDOF = NNODE_ELE * DOF_NODE; %NUMBER OF DEGREES OF FREEDOM PER ELEMENT


%initialize vectors
COORDS = zeros(N_NODE,1);
ELEM_NODE = zeros(NNODE_ELE,N_ELEM);
ELEM_STIFF = zeros(N_ELEM,1);
ELEM_LOAD = zeros(N_ELEM,1);
FORCE_NODE = zeros(N_LOAD,1);
LOAD_VAL = zeros(N_LOAD,1);
DISP_NODE = zeros(N_PRE_DISP,1);
DISP_VAL = zeros(N_PRE_DISP,1);

%getting numbers for coords
A = fscanf(fid,'%f',N_NODE);
count = 1;
for i = 1:N_NODE
    COORDS(i,1) = A(count);
    count = count+1;
end

%elem and elem stiffness
for i = 1:N_ELEM
    A = fscanf(fid,'%f',NNODE_ELE);
    %elem_node
    for j = 1: NNODE_ELE
        ELEM_NODE(j,i) = A(j);
    end
    line = fgetl(fid);
    linet = regexp(line,'[  |\t]','split');
    count = 1;
    linet
    for j = 1:length(linet)
        haha = linet{j}
        if (isempty(haha)|strcmp('  ',haha))
            disp('d')
            continue;
        end
        if (count ==1)
            if (strcmp('UMAT',haha))
                ELEM_STIFF(i,1) = sqrt(-1)
            else
                ELEM_STIFF(i,1) = str2double(haha)
            end
            count = count +1;
        else
            if (strcmp('DLOAD',haha))
                ELEM_LOAD(i,1) = sqrt(-1)
            else
                ELEM_LOAD(i,1) = str2double(haha)
            end
        end
    end
end

%load
ELEM_STIFF
ELEM_LOAD
A = fscanf(fid,'%f');
count = 1;
if (N_LOAD>0)
    for i = 1:N_LOAD
        FORCE_NODE(i,1) = A(count);
        FORCE_VAL(i,1) = A(count+1);
        count = count +2;
    end
end

%displacement
for i = 1:N_PRE_DISP
    DISP_NODE(i,1) = A(count);
    DISP_VAL(i,1) = A(count+1);
    count = count +2;
end
FORCE_NODE
FORCE_VAL
DISP_NODE
DISP_VAL

fclose(fid);
end





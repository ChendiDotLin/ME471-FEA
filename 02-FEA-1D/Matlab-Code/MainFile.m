
clc; clear all;

%% ME 471 / AE 420 / 
% Programming Assignment #2: 1D elastostatic FE code
% Prof. Mariana Silva

% Variables definition

% nnode_ele, the (integer) number of nodes per element
% node_dof, the (integer) number of degrees of freedom per node
% edof, the (integer) number of degrees of freedom per element

NNODE_ELE = 2; %Number of nodes per element
DOF_NODE = 1; %Number of degrees of freedom per node
EDOF = NNODE_ELE*DOF_NODE; %number of degrees of freedom per element

filename = 'input.dat'; 

%read
[COORDS,N_NODE,N_ELEM,N_LOAD,N_PRE_DISP,...
    ELEM_NODE,ELEM_STIFF,...
    ELEM_LOAD,LOAD_NODE,LOAD_VAL,DISP_NODE,DISP_VAL] = ReadInput(filename,NNODE_ELE);



%initialize
[EQ_NUM,N_DOF] = Initialize(N_NODE,N_PRE_DISP,DISP_NODE);

%ASSEMBLE
[KPP,KPF,KFF,KFP,PP,PF,UP] = Assemble(COORDS,N_ELEM,N_LOAD,N_PRE_DISP,ELEM_NODE,ELEM_STIFF,ELEM_LOAD,LOAD_NODE,LOAD_VAL,DISP_NODE,DISP_VAL,EQ_NUM,N_DOF);


%SOOOOOLVE!
[UUR,PUR,UF,PP] = Solve (N_NODE,KPP,KPF,KFF,KFP,PP,PF,UP,EQ_NUM);

%priiiiint~

PrintOutput(EQ_NUM,KPP,KPF,KFP,KFF,UF,PP,UUR,PUR)

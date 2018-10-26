clc; clear all;

%% ME 471 / AE 420 / 
% Programming Assignment #1: Spring finite element code

% Variables definition
% nnode_ele, the (integer) number of nodes per element
% node_dof, the (integer) number of degrees of freedom per node
% edof, the (integer) number of degrees of freedom per element

NNODE_ELE = 2; %Number of nodes per element
DOF_NODE = 1; %Number of degrees of freedom per node
EDOF = NNODE_ELE*DOF_NODE; %number of degrees of freedom per element

% ----------------------------------------------------------
% DO NOT MODIFY THE LINE BELOW!!
% Autograding script will search for this variable definition
filename = 'input.dat';
% -----------------------------------------------------------

%% Read Input File    
   [N_NODE,N_ELEM,N_LOAD,N_PRE_DISP,...
       ELEM_NODE,ELEM_STIFF,...
       FORCE_NODE,FORCE_VAL,DISP_NODE,DISP_VAL] = ReadInput(filename,NNODE_ELE);
 
%% ----------------------------------------------------------------------------
%% Call your Initialize Equation Module
[EQ_NUM, N_DOF] = Initialize(N_NODE,N_PRE_DISP,DISP_NODE);

%% Call your Assemble Module 
[KPP,KPF,KFF,KFP,PF,UP] = Assemble(N_ELEM,N_LOAD,N_PRE_DISP,ELEM_NODE,ELEM_STIFF,FORCE_NODE,FORCE_VAL,DISP_NODE,DISP_VAL,EQ_NUM,N_DOF);

%% Call you Solve Module
[UUR,PUR,UF,PP] = Solve(N_NODE,KPP,KPF,KFF,KFP,PF,UP,EQ_NUM);
 %% ----------------------------------------------------------------------------
%% Print Output File 
PrintOutput(EQ_NUM,KPP,KPF,KFP,KFF,UF,PP,UUR,PUR)

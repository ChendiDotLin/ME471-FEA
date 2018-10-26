clc; clear all;

%% ME 471 / AE 420 / 
% Programming Assignment #4: 2D Truss
% Prof. Mariana Silva

% Variables definition

% nnode_ele, the (integer) number of nodes per element
% node_dof, the (integer) number of degrees of freedom per node
% edof, the (integer) number of degrees of freedom per element


%filename = 'input4.dat'; % Lecture example 1 (Example 1)
%filename = 'input5.dat'; % Lecture example 2 (Example 2)
%filename = 'input.dat'; % Example 4.1 (Example 3) 
%filename = 'input3.dat'; % Example 4.2a) thermal (Example 4)
%filename = 'input2.dat'; % Example 4.2b) non-zero UP (Example 5)
filename = 'inputcrane.dat'; % (Example 6)


%% BEFORE COMMITING YOUR CODE: comment all lines above and keep the line below uncommented!
%% We will modify the line below to read our test input file
%filename = 'input.dat';
%% IMPORTANT INFORMATION

%% Variable allocation size of matrices and vectors used by PrintOutput function
%EQ_NUM (N_NODE, DOF_NODE)
%TOTAL_DOF = N_NODE*DOF_NODE; 
%UF (N_DOF, 1);
%PF (N_DOF, 1); 
%PP (TOTAL_DOF-N_DOF,1);
%UP (TOTAL_DOF-N_DOF,1);
%KPP (TOTAL_DOF-N_DOF, TOTAL_DOF-N_DOF); 
%KFF (N_DOF, N_DOF);
%KPF (TOTAL_DOF-N_DOF,N_DOF); 
%KFP (N_DOF, TOTAL_DOF-N_DOF); 
%UUR (N_NODE,DOF_NODE)
%PUR (N_NODE,DOF_NODE)
%stress (N_ELEM,1)
%strain (N_ELEM,1)

%% Dimension of the problem NDIM =2: 2D Truss problem
NDIM = 2; 

%% Read Input File
[N_NODE,N_ELEM,N_LOAD,N_PRE_DISP,...
       COORDS, ELEM_LOAD, ELEM_NODE,ELEM_STIFF, ELEM_AREA,...
       FORCE_NODE,FORCE_VAL,DISP_NODE,DISP_VAL, ...
       NNODE_ELE, DOF_NODE, EDOF] = ReadInput(filename,NDIM); 
[EQ_NUM,N_DOF,TOTAL_DOF] = Initialize(N_NODE,N_PRE_DISP,DISP_NODE,DOF_NODE);
%% Equation Module

%% Assemble Module 
[KPP,KPF,KFF,KFP,PP,PF,UP] = Assemble(COORDS,N_ELEM,N_LOAD,N_PRE_DISP,ELEM_NODE,ELEM_STIFF,ELEM_LOAD,FORCE_NODE,FORCE_VAL,DISP_NODE,DISP_VAL,EQ_NUM,N_DOF);
%% Solve Module
[UUR,PUR,UF,PP] = Solve(N_NODE,KPP,KPF,KFF,KFP,PP,PF,UP,EQ_NUM);
%% Get Streain and Stress

%% Print Output File 
PrintOutput(EQ_NUM,KPP,KPF,KFP,KFF,UF,PP,UUR,PUR,stress,strain);

%% IMPORTANT INFORMATION: YOU HAVE TO DELETE OR COMMENT THE FOLLOWING LINE BEFORE COMMIT
%PlotTruss(N_ELEM,COORDS,ELEM_NODE,UUR);


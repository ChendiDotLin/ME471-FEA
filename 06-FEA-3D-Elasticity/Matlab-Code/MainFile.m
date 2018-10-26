clc; clear all;close all

%% ME 471 / AE 420 / 
% Programming Assignment #6: 3D Elasticity
% Prof. Mariana Silva

% Variables definition

% nnode_ele, the (integer) number of nodes per element
% node_dof, the (integer) number of degrees of freedom per node
% edof, the (integer) number of degrees of freedom per element



%%To give to students
filename='Patch.dat'; %Example1
%filename = 'inputTortoTextBook.dat';%Example2
%filename='PatchPointForce.dat';%Example3
%filename='Patch-1Element.dat';%Example4
%filename='CantileverFine.dat';
%filename = 'input.dat';
NDIM = 2; % Dimension of the problem (NDIM =2 geometry varying in x and y)


%% Read Input File
[N_NODE,N_ELEM,N_LOAD,N_PRE_DISP,...
       COORDS, ELEM_LOAD, ELEM_NODE,ELEM_STIFF, ELEM_AREA,...
       FORCE_NODE,FORCE_VAL,DISP_NODE,DISP_VAL, ...
       N_TRAC, TRAC_ELE, TRAC_VAL, ...
       NNODE_ELE, DOF_NODE, EDOF, Ng, ShapeOrder, Model2D,material] = ReadInput(filename,NDIM); 

%Initialize
[EQ_NUM,N_DOF,TOTAL_DOF] = Initialize(N_NODE,N_PRE_DISP,DISP_NODE,DOF_NODE);

%%Assemble
[KPP,KPF,KFF,KFP,PP,PF,UP] = Assemble(COORDS,N_ELEM,N_LOAD,N_PRE_DISP,ELEM_LOAD,ELEM_NODE,ELEM_STIFF,ELEM_AREA,FORCE_NODE,FORCE_VAL,DISP_NODE,DISP_VAL,N_TRAC,TRAC_ELE,TRAC_VAL,NNODE_ELE,N_DOF,Ng,ShapeOrder,EQ_NUM,material,EDOF,Model2D);

[UUR,PUR,UF,PP] = Solve(N_NODE,KPP,KPF,KFF,KFP,PP,PF,UP,EQ_NUM);

%% Post-Processing
[StressAtIntegrationPoints, StrainAtIntegrationPoints, StressAtCentroid, StrainAtCentroid,...
    StressAtNodes, StrainAtNodes, TpAtIntegrationPoints,VMAtIntegrationPoints, TpAtCentroid, TpAtNodes, VMAtNodes] ...
    = EvaluateFieldGradient(N_ELEM, N_NODE, NNODE_ELE, DOF_NODE, ...
            NDIM, COORDS, ELEM_NODE, ELEM_STIFF, ShapeOrder , Ng, Model2D, UUR);

     
%PlotDeformedConfiguration(NNODE_ELE, N_ELEM,COORDS,ELEM_NODE,UUR);  
%PlotVectors(NNODE_ELE, N_ELEM, ELEM_NODE, COORDS, UUR)
% 
%PlotFieldonMesh(COORDS',ELEM_NODE, StressAtNodes(:,1), 'sigma x');
%PlotFieldonMesh(COORDS',ELEM_NODE, StressAtNodes(:,4), 'sigma y');
%PlotFieldonMesh(COORDS',ELEM_NODE, VMAtNodes(:), 'Von Mises');
% 

% %% Print Output File 
PrintOutput(EQ_NUM,KPP,KPF,KFP,KFF,UF,PP,UUR,PUR, ...
    StressAtIntegrationPoints, StrainAtIntegrationPoints, StressAtCentroid, StrainAtCentroid, ...
    StressAtNodes, StrainAtNodes,TpAtIntegrationPoints,VMAtIntegrationPoints,TpAtCentroid, TpAtNodes, VMAtNodes);


function PrintOutput(EQ_NUM,KPP,KPF,KFP,KFF,UF,PP,UUR,PUR,...
                StressAtIntegrationPoints, StrainAtIntegrationPoints,  ...
    StressAtCentroid, StrainAtCentroid, StressAtNodes, StrainAtNodes, ...
    TpAtIntegrationPoints,VMAtIntegrationPoints, TpAtCentroid, TpAtNodes, VMAtNodes)

fout = fopen('EQNUM.dat','w');
fprintf(fout, '%12.8f \n', EQ_NUM);
fclose(fout); 

fout = fopen('KPP_Matrix.dat','w');
for i = 1:size(KPP,1)
    fprintf(fout, '%12.8f ', KPP(i,:));
    fprintf(fout, '\n');
end
fclose(fout); 

fout = fopen('KPF_Matrix.dat','w');
for i = 1:size(KPF,1)
    fprintf(fout, '%12.8f ', KPF(i,:));
    fprintf(fout, '\n');
end
fclose(fout); 

fout = fopen('KFP_Matrix.dat','w');
for i = 1:size(KFP,1)
    fprintf(fout, '%12.8f ', KFP(i,:));
    fprintf(fout, '\n');
end
fclose(fout); 

fout = fopen('KFF_Matrix.dat','w');
for i = 1:size(KFF,1)
    fprintf(fout, '%12.8f ', KFF(i,:));
    fprintf(fout, '\n');
end
fclose(fout); 

fout = fopen('UF_Vector.dat','w');
fprintf(fout, '%12.8f \n', UF);
fclose(fout); 

fout = fopen('PP_Vector.dat','w');
fprintf(fout, '%12.8f \n', PP);
fclose(fout); 


fprintf('NODAL FIELD VARIABLE\n')
disp(UUR);
fout = fopen('UUR_Vector.dat','w');
for i = 1:size(UUR,1)
    fprintf(fout, '%12.4f ', UUR(i,:));
    fprintf(fout, '\n');
end

fprintf('NODAL FORCE\n')
disp(PUR);
fout = fopen('PUR_Vector.dat','w');
for i = 1:size(PUR,1)
    fprintf(fout, '%12.4f ', PUR(i,:));
    fprintf(fout, '\n');
end

fprintf('STRESS AT INTEGRATION POINTS\n')
disp(StressAtIntegrationPoints);
fout = fopen('StressAtIntegrationPoints.dat','w');
for i = 1:size(StressAtIntegrationPoints,1)
    fprintf(fout, '%12.4f ',StressAtIntegrationPoints(i,:));
    fprintf(fout, '\n');
end

fprintf('STRAIN AT INTEGRATION POINTS\n')
disp(StrainAtIntegrationPoints);
fout = fopen('StrainAtIntegrationPoints.dat','w');
for i = 1:size(StrainAtIntegrationPoints,1)
    fprintf(fout, '%12.4f ',StrainAtIntegrationPoints(i,:));
    fprintf(fout, '\n');
end

fprintf('PRINCIPAL STRESSES AT INTEGRATION POINTS\n')
disp(TpAtIntegrationPoints);
fout = fopen('PrincipalStressesAtIntegrationPoints.dat','w');
for i = 1:size(TpAtIntegrationPoints,1)
    fprintf(fout, '%12.4f ',TpAtIntegrationPoints(i,:));
    fprintf(fout, '\n');
end

fprintf('VON MISES STRESSES AT INTEGRATION POINTS\n')
disp(VMAtIntegrationPoints);
fout = fopen('VonMisesAtIntegrationPoints.dat','w');
for i = 1:size(VMAtIntegrationPoints,1)
    fprintf(fout, '%12.4f ',VMAtIntegrationPoints(i,1));
    fprintf(fout, '\n');
end

fprintf('STRESS AT CENTROID\n')
disp(StressAtCentroid);
fout = fopen('StressAtCentroid.dat','w');
for i = 1:size(StressAtCentroid,1)
    fprintf(fout, '%12.4f ',StressAtCentroid(i,:));
    fprintf(fout, '\n');
end

fprintf('STRAIN AT CENTROID\n')
disp(StrainAtCentroid);
fout = fopen('StrainAtCentroid.dat','w');
for i = 1:size(StrainAtCentroid,1)
    fprintf(fout, '%12.4f ',StrainAtCentroid(i,:));
    fprintf(fout, '\n');
end

fprintf('PRINCIPAL STRESSES AT CENTROID\n')
disp(TpAtCentroid);
fout = fopen('PrincipalStressesAtCentroid.dat','w');
for i = 1:size(TpAtCentroid,1)
    fprintf(fout, '%12.4f ',TpAtCentroid(i,:));
    fprintf(fout, '\n');
end

fprintf('STRESS AT NODES\n')
disp(StressAtNodes);
fout = fopen('StressAtNodes.dat','w');
for i = 1:size(StressAtNodes,1)
    fprintf(fout, '%12.4f ',StressAtNodes(i,:));
    fprintf(fout, '\n');
end

fprintf('STRAIN AT NODES\n')
disp(StrainAtNodes);
fout = fopen('StrainAtNodes.dat','w');
for i = 1:size(StrainAtNodes,1)
    fprintf(fout, '%12.4f ',StrainAtNodes(i,:));
    fprintf(fout, '\n');
end

fprintf('PRINCIPAL STRESSES AT NODES\n')
disp(TpAtNodes);
fout = fopen('PrincipalStressesAtNodes.dat','w');
for i = 1:size(TpAtNodes,1)
    fprintf(fout, '%12.4f ',TpAtNodes(i,:));
    fprintf(fout, '\n');
end


fprintf('VON MISES STRESSES AT NODES\n')
disp(VMAtNodes);
fout = fopen('VonMisesStressesAtNodes.dat','w');
for i = 1:size(VMAtNodes,1)
    fprintf(fout, '%12.4f ',VMAtNodes(i));
    fprintf(fout, '\n');
end

end

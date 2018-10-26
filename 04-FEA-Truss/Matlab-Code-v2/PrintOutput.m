function PrintOutput(EQ_NUM,KPP,KPF,KFP,KFF,UF,PP,UUR,PUR,stress,strain)

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

fout = fopen('Stress_Vector.dat','w');
fprintf(fout, '%12.8f \n', stress);
fclose(fout); 

fout = fopen('Strain_Vector.dat','w');
fprintf(fout, '%12.8f \n', strain);
fclose(fout); 


fprintf('NODE DISPLACEMENT\n')
disp(UUR);
fout = fopen('UUR_Vector.dat','w');
for i = 1:size(UUR,1)
    fprintf(fout, '%12.8f ', UUR(i,:));
    fprintf(fout, '\n');
end

fprintf('NODE FORCE\n')
disp(PUR);
fout = fopen('PUR_Vector.dat','w');
for i = 1:size(PUR,1)
    fprintf(fout, '%12.8f ', PUR(i,:));
    fprintf(fout, '\n');
end




end

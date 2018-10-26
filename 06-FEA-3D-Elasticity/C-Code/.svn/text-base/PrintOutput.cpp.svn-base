#include <MainFile.h>
using namespace std;

void PrintOutput(const int& n_dof, const int& total_dof, const arma::imat& eq_num, 
		 arma::mat& Kff, arma::mat& Kpp, arma::mat& Kpf,  arma::mat& Kfp, 
		 arma::colvec& Uf, arma::colvec& Pp,  arma::mat& Uur,   arma::mat& Pur, 
		 arma::mat& StrainAtIntegrationPoints, arma::mat& StressAtIntegrationPoints,
		 		arma::mat& TpAtIntegrationPoints, arma::mat& VMAtIntegrationPoints,
		 		arma::mat& StrainAtCentroid, arma::mat& StressAtCentroid, arma::mat& TpAtCentroid,
		 		arma::mat& StrainAtNodes, arma::mat& StressAtNodes, arma::mat& TpAtNodes, arma::mat&  VMAtNodes)
{

  int fixeddofs = total_dof-n_dof;

  ofstream fout;
  fout.open ("EQNUM.dat");
  fout << eq_num;
  fout.close();

  fout.open ("KPP_Matrix.dat");
  for (int i=0;i<fixeddofs;i++){
    for (int j=0;j<fixeddofs;j++){
      if (j<fixeddofs-1) fout << Kpp(i,j) << "\t";
      else fout << Kpp(i,j) << "\n";;
    }
  }
  fout.close();

 fout.open ("KPF_Matrix.dat");
  for (int i=0;i<fixeddofs;i++){
    for (int j=0;j<n_dof;j++){
      if (j<n_dof-1) fout << Kpf(i,j) << "\t";
      else fout << Kpf(i,j) << "\n";;
    }
  }
  fout.close();

 fout.open ("KFP_Matrix.dat");
  for (int i=0;i<n_dof;i++){
    for (int j=0;j<fixeddofs;j++){
      if (j<fixeddofs-1) fout << Kfp(i,j) << "\t";
      else fout << Kfp(i,j) << "\n";;
    }
  }
  fout.close();



 fout.open ("KFF_Matrix.dat");
  for (int i=0;i<n_dof;i++){
    for (int j=0;j<n_dof;j++){
      if (j<n_dof-1) fout << Kff(i,j) << "\t";
      else fout << Kff(i,j) << "\n";;
    }
  }
  fout.close();

  fout.open ("UF_Vector.dat");
  fout << Uf;
  fout.close();
 
  fout.open ("PP_Vector.dat");
  fout << Pp;
  fout.close();

  cout<<"NODAL FIELD VARIABLE\n";
  cout << Uur;
  fout.open ("UUR_Vector.dat");
  fout << Uur;
  fout.close();

  cout<<"NODAL FORCE\n";
  cout << Pur;
  fout.open ("PUR_Vector.dat");
  fout << Pur;
  fout.close();

  cout<<"STRESS AT INTEGRATION POINTS\n";
  cout << StressAtIntegrationPoints;
  fout.open ("StressAtIntegrationPoints.dat");
  fout << StressAtIntegrationPoints;
  fout.close();
  
  cout<<"STRAIN AT INTEGRATION POINTS\n";
  cout << StrainAtIntegrationPoints;
  fout.open ("StrainAtIntegrationPoints.dat");
  fout << StrainAtIntegrationPoints;
  fout.close();
  
  cout<<"PRINCIPAL STRESSES AT INTEGRATION POINTS\n";
  cout << TpAtIntegrationPoints;
  fout.open ("PrincipalStressesAtIntegrationPoints.dat");
  fout << TpAtIntegrationPoints;
  fout.close();
  
  cout<<"VOM MISES STRESSES AT INTEGRATION POINTS\n";
  cout << VMAtIntegrationPoints;
  fout.open ("VonMisesAtIntegrationPoints.dat");
  fout << VMAtIntegrationPoints;
  fout.close();

  cout<<"STRESS AT CENTROID\n";
  cout << StressAtCentroid;
  fout.open ("StressAtCentroid.dat");
  fout << StressAtCentroid;
  fout.close();
  
  cout<<"STRAIN AT CENTROID\n";
  cout << StrainAtCentroid;
  fout.open ("StrainAtCentroid.dat");
  fout << StrainAtCentroid;
  fout.close();
  
  cout<<"PRINCIPAL STRESSES AT CENTROID\n";
  cout << TpAtCentroid;
  fout.open ("PrincipalStressesAtCentroid.dat");
  fout << TpAtCentroid;
  fout.close();
  

  cout<<"STRESSES AT NODES\n";
  cout << StressAtNodes;
  fout.open ("StressAtNodes.dat");
  fout << StressAtNodes;
  fout.close();
  
  cout<<"STRAIN AT NODES\n";
  cout << StrainAtNodes;
  fout.open ("StrainAtNodes.dat");
  fout << StrainAtNodes;
  fout.close();
 
  cout<<"PRINCIPAL STRESSES AT NODES\n";
  cout << TpAtNodes;
  fout.open ("PrincipalStressesAtNodes.dat");
  fout << TpAtNodes;
  fout.close();
  
  cout<<"VOM MISES STRESSES AT NODES\n";
  cout << VMAtNodes;
  fout.open ("VonMisesStressesAtNodes.dat");
  fout << VMAtNodes;
  fout.close();

}

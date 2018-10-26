#include <MainFile.h>
using namespace std;

void PrintOutput(const int& n_dof, const int& total_dof, const arma::imat& eq_num, 
		 arma::mat& Kff, arma::mat& Kpp, arma::mat& Kpf,  arma::mat& Kfp, 
		 arma::colvec& Uf, arma::colvec& Pp,  arma::mat& Uur,   arma::mat& Pur, 
		 arma::mat& FluxAtIntegrationPoints, arma::mat& FluxAtCentroid,
		 arma::mat& NodalFlux, arma::colvec& MagnitudeNodalFlux)
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

  cout<<"FLUX AT INTEGRATION POINTS\n";
  cout << FluxAtIntegrationPoints;
  fout.open ("FluxAtIntegrationPoints.dat");
  fout << FluxAtIntegrationPoints;
  fout.close();

  cout<<"FLUX AT CENTROID\n";
  cout << FluxAtCentroid;
  fout.open ("FluxAtCentroid.dat");
  fout << FluxAtCentroid;
  fout.close();

  cout<<"FLUX AT NODES\n";
  cout << NodalFlux;
  fout.open ("FluxAtNodes.dat");
  fout << NodalFlux;
  fout.close();


  cout<<"FLUX MAGNITUDE AT NODES\n";
  cout << MagnitudeNodalFlux;
  fout.open ("FluxMagnitudeAtNodes.dat");
  fout << MagnitudeNodalFlux;
  fout.close();

}

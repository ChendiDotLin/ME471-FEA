#include <ExampleFEA.h>
using namespace std;

void ExampleFunctions( const int n_node, int& n_dof, int& total_dof,
		       const arma::colvec& elem_stiff, const arma::imat& elem_node, 
		  arma::imat& eq_num, arma::mat& Kff, arma::mat& Kpp, arma::mat& Kpf, 
		  arma::mat& Kfp,  arma::colvec& Pf,  arma::colvec& Pp, arma::colvec& Uf,   
		  arma::colvec& Up,  arma::colvec& Uur,   arma::colvec& Pur )
{
  
  n_dof = 5;
  total_dof = 7;
  int fixeddofs = total_dof-n_dof;
  eq_num = arma::zeros<arma::imat>(n_node,1);
  Pf = arma::zeros<arma::colvec>(n_dof);
  Uf = arma::ones<arma::colvec>(n_dof);
  Pp = arma::zeros<arma::colvec>(fixeddofs);
  Up = arma::zeros<arma::colvec>(fixeddofs);
  Kff = arma::ones<arma::mat>(n_dof,n_dof);
  Kfp = arma::ones<arma::mat>(n_dof,fixeddofs);
  Kpf = arma::zeros<arma::mat>(fixeddofs,n_dof);
  Kpp = arma::zeros<arma::mat>(fixeddofs,fixeddofs);

  Uf = elem_stiff(1)*Uf;

  for (int i=0;i<fixeddofs;i++) {
    for (int j=0;j<n_dof;j++) {
      if (i<j ) {
	Kfp(j,i) = elem_stiff(j);
	Kpf(i,j) = elem_node(0,j);
      }
    }  
  } 
 
  Pp = arma::solve(Kfp,Uf);

  Uur = arma::ones<arma::colvec>(n_node);
  Pur = arma::zeros<arma::colvec>(n_node);


}

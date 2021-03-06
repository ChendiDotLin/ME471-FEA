using namespace std;
#include <MainFile.h>

// ME 471 / AE 420
// Programming Assignment #2: 1D elastostatic FE code

/* Write your main code here */

int main()
{

  int nnode_ele = 2; //nnode_ele: number of nodes per element
  int dof_node = 1; //dof_node: number of degree of freedom per node
  int edof = nnode_ele*dof_node; //edof: number of degree of freedom per element
  int n_dof;
  int total_dof;

  int n_node;
  int n_elem;
  int n_load;
  int n_pre_disp;

  arma::imat elem_node;
  arma::colvec elem_stiff;
  arma::icolvec force_node;
  arma::colvec force_val;
  arma::icolvec disp_node;
  arma::colvec disp_val;

  arma::imat eq_num;
  arma::colvec Pf;
  arma::colvec Pp;
  arma::colvec Uf;
  arma::colvec Up;
  arma::colvec Uur;
  arma::colvec Pur;
  arma::mat Kff;
  arma::mat Kfp;
  arma::mat Kpf;
  arma::mat Kpp;

  // =========================================================
  // DO NOT MODIFY THE LINE BELOW!!
  //Autograding script will search for this variable definition
  string filename = "input.dat";
  // =========================================================
 
  /*=========================================================;
  %                 Complete your FEA code                   ;
  %=========================================================*/
  
 /*=========================================================;
  %                 Write Output Files                      ;
  %=========================================================*/ 
  PrintOutput( n_dof, total_dof,  eq_num, Kff,  Kpp,  Kpf,  Kfp, Uf , Pp, Uur, Pur);

  return(0);
}




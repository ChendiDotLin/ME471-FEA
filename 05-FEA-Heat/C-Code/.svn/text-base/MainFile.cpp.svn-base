using namespace std;
#include <MainFile.h>

// ME 471 / AE 420
// Programming Assignment #5: 2D Heat Transfer


int main()
{

  int nnode_ele; //nnode_ele: number of nodes per element
  int dof_node;  //dof_node: number of degree of freedom per node
  int edof;      //edof: number of degree of freedom per element
  int n_dof;
  int total_dof;
  int ndim = 2; // problem dimension (2D truss => ndim = 2)

  int Ng;
  int ShapeOrder;

  int n_node;
  int n_elem;
  int n_load;
  int n_pre_disp;
  int n_trac_c;
  int n_trac_q;

  arma::mat coords;
  arma::imat elem_node;
  arma::mat  elem_stiff;
  arma::mat  elem_load;
  arma::mat  elem_area;
  arma::imat force_node;
  arma::colvec force_val;
  arma::imat  disp_node;
  arma::colvec disp_val;
  arma::imat trac_q_ele;
  arma::imat  trac_c_ele;
  arma::mat trac_q_val;
  arma::mat  trac_c_val;

  arma::imat eq_num;
  arma::colvec Pf;
  arma::colvec Pp;
  arma::colvec Uf;
  arma::colvec Up;
  arma::mat Uur;
  arma::mat Pur;
  arma::mat Kff;
  arma::mat Kfp;
  arma::mat Kpf;
  arma::mat Kpp;

  arma::mat FluxAtIntegrationPoints;
  arma::mat FluxAtCentroid;
  arma::mat NodalFlux;
  arma::colvec MagnitudeNodalFlux;
  arma::mat NodalGradT;
  arma::colvec MagnitudeGradT;

  //string filename = "inputExample10_4_QUAD.dat"; //Lecture notes
  //string filename = "input_Incropera_4_3.dat"; //% (Example 1)
  //string filename = "Example4-4-Incropera.dat"; //%(Example 2)
  //string filename = "LShapeMesh.dat"; //%(Example 3)
  //string filename = "ChimneyNew.dat"; //%(Example4)
  //string filename = "inputhw7.dat"; //%homework 7

  //%% BEFORE COMMITING YOUR CODE: comment all lines above and keep the line below uncommented!
  //%% We will modify the line below to read our test input file
  string filename = "input.dat";
  //%% IMPORTANT INFORMATION
  
  /*=========================================================;
  %                 Read data from input files               ;
  %=========================================================*/
  ReadInput(filename, ndim,  n_node, n_elem, n_load, n_pre_disp, nnode_ele,dof_node,edof,
	    coords, elem_node, elem_stiff, elem_load, elem_area,  force_node, force_val, 
	    disp_node, disp_val, n_trac_q, trac_q_ele, trac_q_val,
	        n_trac_c, trac_c_ele, trac_c_val, Ng, ShapeOrder);
   /*==========================================================;
 %                 Creating Global Id matrix                 ;
 %===========================================================*/
  
 /*==========================================================;
 %                 Assemble Module                            ;
 %===========================================================*/
  

 /*==========================================================;
 %                 Solve (Analysis)                          ;
 %===========================================================*/
 

 /*=========================================================;
  %                 Post-Processing                         ;
  %=========================================================*/
  EvaluateFieldGradient( nnode_ele, n_node, n_elem, dof_node, Ng, ShapeOrder, ndim,
		  coords, elem_node, elem_stiff, Uur, FluxAtIntegrationPoints, FluxAtCentroid, NodalFlux,
 		 MagnitudeNodalFlux, NodalGradT, MagnitudeGradT);
 /*=========================================================;
  %                 Write Output Files                      ;
  %=========================================================*/ 
  PrintOutput( n_dof, total_dof,  eq_num, Kff,  Kpp,  Kpf,  Kfp, Uf , Pp,
		  Uur, Pur, FluxAtIntegrationPoints, FluxAtCentroid,
			 NodalFlux, MagnitudeNodalFlux);

  return(0);
}




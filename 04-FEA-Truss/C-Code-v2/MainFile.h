#include <stdio.h>
#include <stdlib.h>
#include <string.h>
// INCLUDE ARMADILLO LIBRARY DEFINITIONS
#include <armadillo>
#include <iostream>
#include <iomanip>


void ReadInput(const std::string& filename, const int ndim, int& n_node, int& n_elem, int& n_load, int& n_pre_disp,
	       int& nnode_ele, int& dof_node, int& edof, 
	       arma::mat& coords, arma::imat& elem_node, arma::mat& elem_stiff, 
	       arma::mat& elem_load, arma::mat& elem_area, arma::imat& force_node, arma::colvec& force_val, 
	       arma::imat& disp_node, arma::colvec& disp_val);


void PrintOutput(const int& n_dof, const int& total_dof, const arma::imat& eq_num, 
		 arma::mat& Kff, arma::mat& Kpp, arma::mat& Kpf,  arma::mat& Kfp, 
		 arma::colvec& Uf, arma::colvec& Pp,  arma::mat& Uur,   arma::mat& Pur,
		 arma::mat& strain, arma::mat& stress);

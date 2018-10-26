#include <stdio.h>
#include <stdlib.h>
#include <string.h>
// INCLUDE ARMADILLO LIBRARY DEFINITIONS
#include <armadillo>
#include <iostream>
#include <iomanip>

void ReadInput(const std::string& filename, int& n_node, int& n_elem, int& n_load, int& n_pre_disp, const int nnode_ele, 
arma::imat& elem_node, arma::colvec& elem_stiff, arma::icolvec& force_node,arma::colvec& force_val, 
arma::icolvec& disp_node, arma::colvec& disp_val);

void PrintOutput(const int& n_dof, const int& total_dof, const arma::imat& eq_num, 
		 arma::mat& Kff, arma::mat& Kpp, arma::mat& Kpf,  arma::mat& Kfp, 
		 arma::colvec& Uf, arma::colvec& Pp,  arma::colvec& Uur,   arma::colvec& Pur);

#include <MainFile.h>
using namespace std;


void GetElementFluxVector(const int i_elem,  const int nnode_ele, const int dof_node,
		const int Ng, const int ShapeOrder, const int Model2D, const int ndim, const arma::mat& coords, const arma::imat& elem_node,
		const arma::mat& elem_stiff,const int location, const arma::mat& Uur,
		arma::mat& stress, arma::mat& strain)

{

 
  if (location == 1) {

	 
  }

  if (location == 0) {
  }
}

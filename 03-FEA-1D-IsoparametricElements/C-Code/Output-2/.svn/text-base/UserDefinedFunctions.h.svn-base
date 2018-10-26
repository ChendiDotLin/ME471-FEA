#include <stdio.h>

double UMAT(double x);
double DLOAD(double x);
double UAREA(double x);



// -------------------------------------------------------
// Functions for test example 2 (and also works for example 1
double UMAT(double x)

{

	double Eval;

	if (x<=2) {
		Eval = 20*x;
	}
	else if ( (x >= 4) && (x<=7) ){
		Eval = 10*x+20;
	}
	else {
		std::cout<<"UMAT is not defined for x = " << x<<"\n";
		exit(1);
	}

	return(Eval);

}


double DLOAD(double x)

{

	double bval;

	if (x<=2) {
		bval = pow(x,2);
	}
	else if ( (x >= 2) && (x<=3) ){
		bval = -x;
	}
	else if ( (x >= 3) && (x<=4) ){
		bval = -2*pow(x,2);
	}
	else if ( (x >= 6) && (x<=7) ){
		bval = x;
	}
	else {
		std::cout<<"DLOAD is not defined for x = " << x<<"\n";
		exit(1);
	}

	return(bval);

}

double UAREA(double x)

{

	double area;

	area = 1;

	return(area);

}

// -------------------------------------------------------

/*
// Functions for the example that appear in PA#3
double UMAT(double x)

{

	double Eval;

	if (x<=7) {
		Eval = 10+20*x;
	}
	else {
			std::cout<<"UMAT is not defined for x = " << x<<"\n";
			exit(1);
	}

	return(Eval);

}


double DLOAD(double x)

{

	double bval;

	bval = pow(x,2);

	return(bval);

}

double UAREA(double x)

{

	double area;

	area = 1;

	return(area);

}*/


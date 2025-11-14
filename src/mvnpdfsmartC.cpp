#include <RcppArmadillo.h>
using namespace arma;
// [[Rcpp::depends(RcppArmadillo)]]

//'mvpdfsmartC
//'
//'@param x matrix x
//'@param mean column vector of x's mean
//'@param varcovM matrix of x's variance-covariance
//'@param Log boolean. If true, return log values of x's multivariate normal distribution
//'
//'@rdname mvnpdfsmartC
//'@export
//'
// [[Rcpp::export]]

 arma::vec mvnpdfsmartC(arma::mat x,
                        arma::colvec mean,
                        arma::mat varcovM,
                        bool Log=true) {
   int p = x.n_rows;
   int n = x.n_cols;

   mat invvarcovM = inv_sympd(varcovM);
   double LogDetvarcovM = log_det_sympd(varcovM);

   vec y(n);
   for (int j=0; j < n; j++){
     colvec x_0 = x.col(j) - mean;
     vec tempres = -p/2.0 * log(2.0*M_PI) - 0.5 * LogDetvarcovM - 0.5 * x_0.t() * invvarcovM * x_0;
     y(j) =  tempres(0);
   }

   if (!Log){
     y =  exp(y);
   }

   return y;
 }

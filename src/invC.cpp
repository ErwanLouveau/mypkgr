#include <RcppArmadillo.h>
using namespace Rcpp;
using namespace arma;

// [[Rcpp::depends(RcppArmadillo)]]

// [[Rcpp::export]]
arma::mat invC(const arma::mat& M) {
  if (M.n_rows != M.n_cols) {
    stop("Erreur : la matrice n'est pas carrée !");
  }

  // calcul du déterminant
  double det= arma::det(M);
  if (det==0){
    stop("Erreur : le déterminant est égal à 0, la matrice n'est pas inversible");
  }

  // Calcul de l'inverse
  arma::mat Minv = arma::inv(M);

  return Minv;
}

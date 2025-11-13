#' mvnpdf
#'
#' @description
#' mvnpdf calculates the multivariate distribution of a matrix
#'
#' @param x numeric matrix.
#' @param mean vector containing each mean of x's columns.
#' @param varcovM variance covariance matrix of x.
#' @param Log logical; if TRUE return the logarithm of multivariate distribution.
#'
#' @returns a list containing values of x matrix and values of multivariate distribution calculated
#' @export
#'
#' @importFrom mvtnorm dmvnorm
#'

mvnpdf <- function(x, mean = rep(0, nrow(x)), varcovM = diag(nrow(x)), Log=TRUE){

  n = ncol(x)
  p = nrow(x)
  x0 = x - mean
  Rinv = solve(varcovM)
  LogDetvarcovM = log(det(varcovM))

  y = NULL

  for (i in 1:n){
    yj = -p/2 * log(2*pi) - 0.5 * LogDetvarcovM - 0.5 * t(x0[, i]) %*% Rinv %*% x0[, i]
    y = c(y, yj)
  }

  if (!Log){
    y = exp(y)
  }

  res = list(x = x, y = y)
  class(res) <- "mvnpdf" # declare mvnpdf function return mvnpdf class object
  return(res)
}

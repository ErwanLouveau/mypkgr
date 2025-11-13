#' mvnpdfoptim
#'
#' @description
#' Optimised function of mvnpdf. Calculates the multivariate distribution of a matrix
#'
#' @param x numeric matrix.
#' @param mean vector containing each mean of x's columns.
#' @param varcovM variance covariance matrix of x.
#' @param Log logical; if TRUE return the logarithm of multivariate distribution.
#'
#' @returns a list containing values of x matrix and values of multivariate distribution calculated
#'
#' @rdname mvnpdfoptim
#' @export
mvnpdfoptim <- function(x, mean =  rep(0, nrow(x)),
                        varcovM = diag(nrow(x)), Log=TRUE){

  if(!is.matrix(x)){
    x <- matrix(x, ncol=1)
  }

  n <- ncol(x)
  p <- nrow(x)
  x0 <- x-mean

  Rinv <- backsolve(chol(varcovM), x=diag(p))
  xRinv <- apply(X=x0, MARGIN=2, FUN=crossprod, y=Rinv)
  logSqrtDetvarcovM <- sum(log(diag(Rinv)))

  quadform <- apply(X=xRinv, MARGIN=2, FUN=crossprod)
  y <- (-0.5*quadform + logSqrtDetvarcovM -p*log(2*pi)/2)

  if(!Log){
    y <- exp(y)
  }

  res <- list(x = x, y = y)
  class(res) <- "mvnpdf"
  return(res)
}

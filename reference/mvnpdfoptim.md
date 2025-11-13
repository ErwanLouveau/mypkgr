# mvnpdfoptim

Optimised function of mvnpdf. Calculates the multivariate distribution
of a matrix

## Usage

``` r
mvnpdfoptim(x, mean = rep(0, nrow(x)), varcovM = diag(nrow(x)), Log = TRUE)
```

## Arguments

- x:

  numeric matrix.

- mean:

  vector containing each mean of x's columns.

- varcovM:

  variance covariance matrix of x.

- Log:

  logical; if TRUE return the logarithm of multivariate distribution.

## Value

a list containing values of x matrix and values of multivariate
distribution calculated

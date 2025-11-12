# Density of a multivariate normal distribution

This function computes the values of the density of a multivariate
normal \#' distribution on R\*\*p at n points

## Usage

``` r
mvnpdf(x, mean = rep(0, nrow(x)), varcovM = diag(nrow(x)), Log = TRUE)
```

## Arguments

- x:

  a matrix, with n columns (the observations) and p rows

- mean:

  a vector of means

- varcovM:

  a variance-covariance matrix

- Log:

  a logical parameter, with default value to TRUE

## Value

x, y multivariate normal distribution density values

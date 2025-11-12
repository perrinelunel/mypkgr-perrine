#' @title
#' Density of a multivariate normal distribution
#'
#' @description
#' This function computes the values of the density of a multivariate normal
#' #' distribution on R**p at n points
#'
#' @param x a matrix, with n columns (the observations) and p rows
#' @param mean a vector of means
#' @param varcovM a variance-covariance matrix
#' @param Log a logical parameter, with default value to TRUE
#'
#' @returns x, y multivariate normal distribution density values
#'
#' @export
#'
#' @importFrom mvtnorm dmvnorm


mvnpdf <- function(x, mean = rep(0, nrow(x)),
                   varcovM = diag(nrow(x)), Log = TRUE) {
  p <- nrow(x)
  n <- ncol(x)

  # Il est potentiellement plus intéressant de calculer en log, et de repasser
  # à l'exp si besoin

  invVarcovM <- solve(varcovM)
  detVarcovM <- det(varcovM)

  xMinusMean <- x - mean # center

  y <- NULL
  for (j in 1:n) {
    yj <- ((2*pi)**(-p/2)) * detVarcovM**(-0.5) * exp(-0.5 * t(xMinusMean[,j]) %*% invVarcovM %*% xMinusMean[,j])
    y <- c(y, yj)
    }

  if (Log) {
    y <- log(y)
  }

  res <- list(x = x, y = y)
  class(res) <- "mvnpdf"
  return(res)

}

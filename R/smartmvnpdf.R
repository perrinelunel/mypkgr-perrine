#' @rdname mvnpdf
#' @export
#'


smartmvnpdf <- function(x, mean = rep(0, nrow(x)),
                   varcovM = diag(nrow(x)), Log = TRUE) {
  p <- nrow(x)
  n <- ncol(x)

  # Il est potentiellement plus intéressant de calculer en log, et de repasser
  # à l'exp si besoin

  invVarcovM <- solve(varcovM)
  detVarcovM <- det(varcovM)

  xMinusMean <- x - mean # center

  y <- rep(NA, n)
  for (j in 1:n) {
    yj <- ((2*pi)**(-p/2)) * detVarcovM**(-0.5) * exp(-0.5 * t(xMinusMean[,j]) %*% invVarcovM %*% xMinusMean[,j])
    y[j] <- yj
  }

  if (Log) {
    y <- log(y)
  }

  res <- list(x = x, y = y)
  class(res) <- "mvnpdf"
  return(res)

}

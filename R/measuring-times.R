library(mypkgr)

# Avec system.time ----

obs <- matrix(rep(1.96, 2), nrow=2, ncol=1)
system.time(mvnpdf(x=obs, Log=FALSE))

obs <- rep(1.96, 2)
system.time(mvtnorm::dmvnorm(obs))

# Pas très précis

# Avec microbenchmark ----
library(microbenchmark)
library(ggplot2)
mb <- microbenchmark(mvtnorm::dmvnorm(rep(1.96, 2)),
                     mvnpdf(x = matrix(rep(1.96,2)), Log = FALSE),
                     times = 1000)
mb

ggplot(mb, aes(x = expr, y = time, fill = expr)) +
  geom_violin() +
  scale_fill_manual(values = c("maroon", "navy"),labels = c("dmvnorm", "mvnpdf")) +



n <- 100
mb <- microbenchmark(mvtnorm::dmvnorm(matrix(1.96, nrow = n, ncol = 2)),
                     mvnpdf(x=matrix(1.96, nrow = 2, ncol = n),
                            Log=FALSE),
                     times=100)
mb

ggplot(mb, aes(x = expr, y = time)) +
  geom_violin()


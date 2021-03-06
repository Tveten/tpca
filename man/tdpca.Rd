% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tdpca.R
\name{tdpca}
\alias{tdpca}
\alias{tailorDPCA}
\alias{tailoredDPCA}
\title{Tailors the choice of principal components for change detection with lagged variables}
\usage{
tdpca(cov_mat, lag, change_distr = "full_uniform",
  divergence = "normal_hellinger", cutoff = 0.99,
  max_axes = ncol(cov_mat), n_sim = 10^3)
}
\arguments{
\item{cov_mat}{A covariance matrix of lagged variables. Must be positive
definite.}

\item{lag}{The number of lags used.}

\item{change_distr}{A string or a change distribution object. A string can be
used to choose among a set of already implemented distributions:
'full_uniform', 'mean_only', 'sd_only', 'cor_only'. Custom change
distributions can be specified by using the \code{\link{set_uniform_cd}}
function.}

\item{divergence}{A string specifying which divergence metric to use. 
Available options: 'normal_hellinger', 'normal_KL' and 'normal_bhat'.}

\item{cutoff}{A numeric between 0 and 1 governing how many principal axes to
retain.}

\item{max_axes}{An integer indicating the maximum number of axes that should be
returned regardless of what the cutoff is.}

\item{n_sim}{An integer specifying the number of simulation runs.}
}
\value{
\code{tpca} returns an S3 object of class "tpca". This is a list with 
the following components:
\describe{
  \item{\code{axes}}{A matrix with the chosen principal axes as rows, 
  ordered in decreasing order of sensitivity.}
  \item{\code{which_axes}}{A vector indicating which principal axes that were
  chosen in decreasing order of sensitivity.}
  \item{\code{prop_axes_max}}{A vector with the proportion of simulations each axis
  was the most sensitive one.}
  \item{\code{divergence_sim}}{A matrix containing all the simulated draws 
  from the divergence metric along each principal axis. It is of dimension 
  data_dim x n_sim.}
  \item{\code{change_type}}{A character vector indicating the type of change 
  for each iteration of the simulation.}
  \item{\code{change_sparsity}}{A numeric vector indicating the sparsity of 
  the change for each iteration of the simulation.}
}
}
\description{
\code{tdpca} tailors the choice of principal components to keep when detection
of changepoints in the mean vector or covariance matrix is the aim.
It extends \code{\link{tpca}} by allowing the input to be a covariance matrix 
of a Hankel matrix (a data matrix with lagged variables stacked on top of 
eachother), and thus incorporate time dynamics.
Note that the dimension for the change distribution is the dimension of
the data without lagged variables.
See the documentation for \code{\link{tpca}} for more information.
}
\examples{

}
\references{

}

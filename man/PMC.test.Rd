% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/PMC.test.R
\name{PMC.test}
\alias{PMC.test}
\title{Random shift test of independence between marks of a point process and a covariate}
\usage{
PMC.test(
  X,
  covariate,
  N.shifts = 999,
  radius,
  correction,
  type = "Kendall",
  verbose = FALSE
)
}
\arguments{
\item{X}{marked point pattern dataset (object of class \code{ppp})}

\item{covariate}{random field (object of class \code{im})}

\item{N.shifts}{integer, how many random shifts should be performed in the random shift test}

\item{radius}{positive real number determining the radius of the disk on which the shift vectors are uniformly distributed}

\item{correction}{which correction should be applied in the random shift test (possible choices are "torus" and "variance")}

\item{type}{... which test statistic should be used (possible choices are "Kendall", "Pearson" and "covariance")}

\item{verbose}{logical value indicating whether auxiliary information should be printed and auxiliary figures plotted during the computation}
}
\value{
The p-value of the random shift test of independence between marks of a point process and a covariate.
}
\description{
Nonparametric test of independence between marks of a point process and a random field
(covariate) based on random shifts, see Dvořák et al. (2022).
Either the torus correction or the variance correction can be used, see Mrkvička et al. (2021).
}
\details{
The test statistic can be either the sample covariance or the sample Kendall's or
Pearson's correlation coefficient, computed from the vector of marks and
the vector of covariate values observed at the points of the process, see the paper
Dvořák et al. (2022). These test statistics make the test sensitive to violation
of independence between the marks and the covariate. On the other hand, the
test can also be viewed as a test of independence between a marked point process
and a covariate.

The torus correction can be applied for rectangular windows. On the other hand,
the variance correction is applicable both for rectangular and for irregular windows.
The choice of the correction is given by the argument \code{correction}.
Based on the simulation studies in Dvořák et al. (2022),
the variance correction is recommended since it does not exhibit the liberality of the torus correction.

The choice of the test statistic is given
by the argument \code{type}. The observed marked point pattern should be supplied using the
argument \code{X}, the realization of the covariate should be supplied using
the argument \code{covariate}.

The shift vectors are generated from the
uniform distribution on the disk with radius given by the argument \code{radius}
and centered in the origin. The argument \code{verbose} determines if
auxiliary information and plots should be provided.
}
\examples{

library(spatstat)

set.seed(123)

elevation <- bei.extra$elev
slope <- bei.extra$grad
plot(elevation)
plot(slope)

# use only part of the point pattern for this example
Xun <- rthin(bei,0.05)

# use elevation values as marks
X <- Xun \%mark\% elevation[Xun]

# use terrain gradient as covariate
covariate <- slope

# tests run with only 99 shifts to speed up the computation
out1 <- PMC.test(X=X, covariate=covariate, N.shifts = 99, radius=250, correction="torus",
                 type="Kendall", verbose=TRUE)
out1

out2 <- PMC.test(X=X, covariate=covariate, N.shifts = 99, radius=250, correction="variance",
                 type="Kendall", verbose=TRUE)
out2

}
\references{
J. Dvořák, T. Mrkvička, J. Mateu, J.A. González (2022): Nonparametric testing of the dependence structure among points-marks-covariates in spatial point patterns. International Statistical Review 90(3), 592-621.

T. Mrkvička, J. Dvořák, J.A. González, J. Mateu (2021): Revisiting the random shift approach for testing in spatial statistics. Spatial Statistics 42, 100430.
}

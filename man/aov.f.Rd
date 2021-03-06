% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/aov_f.R
\name{aov.f}
\alias{aov.f}
\title{ANOVA for a factorial experiment}
\usage{
aov.f(trait, factors, rep, dfr, maxp = 0.1)
}
\arguments{
\item{trait}{The trait to analyze.}

\item{factors}{The factors.}

\item{rep}{The replications or blocks, \code{NULL} for a CRD.}

\item{dfr}{The name of the data frame.}

\item{maxp}{Maximum allowed proportion of missing values to estimate, default is 10\%.}
}
\value{
It returns the ANOVA table.
}
\description{
Fit an analysis of variance model for a factorial experiment with a CRD or RCBD.
}
\examples{
aov.f("asc.dw", c("geno", "treat"), NULL, asc)
}
\author{
Raul Eyzaguirre.
}

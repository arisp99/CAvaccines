% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/graphing_functions.R
\name{density_plot}
\alias{density_plot}
\title{Plot density plot}
\usage{
density_plot(data, variable, title = NULL, xlab = NULL, ylab = "Density")
}
\arguments{
\item{data}{The dataset that contains the variable to be plotted}

\item{variable}{The variable to be plotted}

\item{title}{The title of the figure. By default set to \code{NULL}.}

\item{xlab}{The x label of the figure. By default set to \code{NULL}.}

\item{ylab}{The y label of the figure. By default set to \code{"Density"}.}
}
\description{
Plots a density plot using ggplot2.
}

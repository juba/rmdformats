\name{pilltabs}
\alias{pilltabs}
\title{Given a cross-table, outputs HTML code to display several views of with a tabbed interface}
\usage{
  pilltabs(tab, count = TRUE, rows = TRUE, cols = TRUE,
    chisq = TRUE, resid = TRUE)
}
\arguments{
  \item{tab}{a two dimensions table object}

  \item{count}{wether or not to the displya the count
  table}

  \item{rows}{wether or not to the displya the row
  percentages table}

  \item{cols}{wether or not to the displya the column
  percentages table}

  \item{chisq}{wether or not to the displya the table
  chi-squared test results}

  \item{resid}{wether or not to the displya the chi-squared
  residuals table}
}
\value{
  No value is returned.
}
\description{
  Given a two dimensions contingency tables, this function
  outputs HTML code to display, within a dynamic tabbed
  interface, the count, line row percentages, column
  percentages and chi-squared residuals tables.
}
\details{
  The function is intended to be called inside an rmarkdown
  document.
}
\author{
  Julien Barnier <julien.barnier@ens-lyon.fr>
}


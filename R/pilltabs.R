#' Given a cross-table, outputs HTML code to display several views of with a tabbed interface
#'
#' Given a two dimensions contingency tables, this function outputs HTML code to display,
#' within a dynamic tabbed interface, the count, line row percentages, column percentages and
#' chi-squared residuals tables.
#'
##' @param tab a two dimensions table object
##' @param count wether or not to the displya the count table
##' @param rows wether or not to the displya the row percentages table
##' @param cols wether or not to the displya the column percentages table
##' @param chisq wether or not to the displya the table chi-squared test results
##' @param resid wether or not to the displya the chi-squared residuals table
#' @details
#' The function is intended to be called inside an rmarkdown document.
#' @return
#' No value is returned.
#' @author Julien Barnier <julien.barnier@@ens-lyon.fr>
#' @export
#' @importFrom questionr cprop rprop chisq.residuals
#' @importFrom knitr kable asis_output


pilltabs <- function(tab, count=TRUE, rows=TRUE, cols=TRUE, chisq=TRUE, resid=TRUE, row.names=TRUE) {
  
    res <- list()

    if (count) res[["count"]] <- kable(tab, output=FALSE, row.names=row.names)
    if (rows)  res[["rows"]] <- kable(round(questionr::rprop(tab, n=TRUE),1), output=FALSE, row.names=row.names)
    if (cols)  res[["cols"]] <- kable(round(questionr::cprop(tab, n=TRUE),1), output=FALSE, row.names=row.names)
    if (resid) res[["resid"]] <- kable(round(questionr::chisq.residuals(tab),2), output=FALSE, row.names=row.names)
    if (chisq) {
      test <- chisq.test(tab)
      res[["chisq"]] <- paste0('X-squared = ', round(test$statistic, 4), 
                               ', df = ', test$parameter,
                               ', p = ', format.pval(test$p.value, digits=4)) 
    }
    class(res) <- "pilltabs"
    res
}


#' @export
print.pilltabs <- function(res) {
  if (!is.null(res[["count"]])) {
    cat("\n--- COUNT ---\n\n")
    cat(res[["count"]], sep="\n")
  }
  if (!is.null(res[["rows"]])) {
    cat("\n--- ROWS % ---\n\n")
    cat(res[["rows"]], sep="\n")
  }
  if (!is.null(res[["cols"]])) {
    cat("\n--- COLS % ---\n\n")
    cat(res[["cols"]], sep="\n")
  }
  if (!is.null(res[["resid"]])) {
    cat("\n--- CHI2 RESIDUALS ---\n\n")
    cat(res[["resid"]], sep="\n")
  }
  if (!is.null(res[["chisq"]])) {
    cat("\n\n",res[["chisq"]],"\n\n")
  }
}

#' @export
#' @importFrom knitr opts_knit
knit_print.pilltabs <- function(res, options) {
  result <- ""
    
  if (knitr::opts_knit$get("rmarkdown.pandoc.to")=="html") {
    ## Generating unique div ids
    id <- round(runif(1) * 10e10)
    result <- paste0(result, '<ul class="nav nav-pills nav-pilltabs">\n')
    if (!is.null(res[["count"]]))
      result <- paste0(result, '<li><a href="#dyntab-count', id,'" data-toggle="pill">Count</a></li>\n')
    if (!is.null(res[["rows"]]))
      result <- paste0(result, '<li><a href="#dyntab-rows', id,'" data-toggle="pill">Rows %</a></li>\n')
    if (!is.null(res[["cols"]]))
      result <- paste0(result, '<li><a href="#dyntab-columns', id,'" data-toggle="pill">Columns %</a></li>\n')
    if (!is.null(res[["resid"]]))
      result <- paste0(result, '<li><a href="#dyntab-residuals', id,'" data-toggle="pill">Residuals</a></li>\n')
    result <- paste0(result, '</ul>\n')
    result <- paste0(result, '<div class="tab-content">\n')
    if (!is.null(res[["count"]]))
      result <- paste0(result,
                       '  <div class="tab-pane dyntab" id="dyntab-count', id,'">\n\n\n',
                       paste(res[["count"]], collapse="\n"),
                       '\n\n\n  </div>\n')
    if (!is.null(res[["rows"]]))    
      result <- paste0(result,
                       '  <div class="tab-pane dyntab" id="dyntab-rows', id,'">\n\n\n',
                       paste(res[["rows"]], collapse="\n"),
                       '\n\n\n  </div>\n')
    if (!is.null(res[["cols"]]))    
      result <- paste0(result,
                       '  <div class="tab-pane dyntab" id="dyntab-columns', id,'">\n\n\n',
                       paste(res[["cols"]], collapse="\n"),
                       '\n\n\n  </div>\n', sep="\n")
    if (!is.null(res[["resid"]]))    
      result <- paste0(result,
                       '  <div class="tab-pane dyntab-residuals" id="dyntab-residuals', id,'">\n\n\n',
                       paste(res[["resid"]], collapse="\n"),
                       '\n\n\n  </div>\n', sep="\n")
    result <- paste0(result,
                     '</div>', sep="\n")
    if (!is.null(res[["chisq"]])) {
      result <- paste0(result,
                       '<p class="chisq-results">', res[["chisq"]],'</p>')
    }
  }
  else {
    if (!is.null(res[["count"]])) {
      result <- paste0(result, "\n\nCount :\n\n", paste(res[["count"]], collapse="\n"))
    }
    if (!is.null(res[["rows"]])) {
      result <- paste0(result, "\n\nRows percentage :\n\n", paste(res[["rows"]], collapse="\n"))
    }
    if (!is.null(res[["cols"]])) {
      result <- paste0(result, "\n\nColumns percentage :\n\n", paste(res[["cols"]], collapse="\n"))
    }
    if (!is.null(res[["resid"]])) {
      result <- paste0(result, "\n\nChi-squared residuals :\n\n", paste(res[["resid"]], collapse="\n"))
    }
    if (!is.null(res[["chisq"]])) {
      result <- paste0(result, "\n\n", res[["chisq"]])
    }
  }
  
  asis_output(result)
}








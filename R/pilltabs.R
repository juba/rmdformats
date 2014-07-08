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
#' @importFrom knitr kable


pilltabs <- function(tab, count=TRUE, rows=TRUE, cols=TRUE, chisq=TRUE, resid=TRUE) {

    ## Tab counter for generating unique div ids
    if (!exists(".dyntabseq", envir=parent.frame())) {
        .dseq <- 1
        assign(".dyntabseq", 1, envir=parent.frame())
    }
    else {
        .dseq <- get(".dyntabseq", envir=parent.frame())
        .dseq <- .dseq + 1
        assign(".dyntabseq", .dseq, envir=parent.frame())
    }
        
    result <- paste0('<ul class="nav nav-pills">\n',
                    '  <li class="active"><a href="#dyntab-count', .dseq,'" data-toggle="pill">Count</a></li>\n',
                    '  <li><a href="#dyntab-rows', .dseq,'" data-toggle="pill">Rows %</a></li>\n',
                    '  <li><a href="#dyntab-columns', .dseq,'" data-toggle="pill">Columns %</a></li>\n ',
                    '  <li><a href="#dyntab-residuals', .dseq,'" data-toggle="pill">Residuals</a></li>\n',
                    '</ul>\n',
                    '<div class="tab-content">\n')
    if (count)
        result <- paste0(result,
                        '  <div class="tab-pane active" id="dyntab-count', .dseq,'">\n\n\n',
                        paste(kable(tab, output=FALSE), collapse="\n"),
                        '\n\n\n  </div>\n')
    if (rows)    
        result <- paste0(result,
                        '  <div class="tab-pane" id="dyntab-rows', .dseq,'">\n\n\n',
                        paste(kable(round(questionr::rprop(tab, n=TRUE),1), output=FALSE), collapse="\n"),
                        '\n\n\n  </div>\n')
    if (cols)    
        result <- paste0(result,
                        '  <div class="tab-pane" id="dyntab-columns', .dseq,'">\n\n\n',
                        paste(kable(round(questionr::cprop(tab, n=TRUE),1), output=FALSE), collapse="\n"),
                        '\n\n\n  </div>\n', sep="\n")
    if (resid)    
        result <- paste0(result,
                        '  <div class="tab-pane" id="dyntab-residuals', .dseq,'">\n\n\n',
                        paste(kable(round(questionr::chisq.residuals(tab),2), output=FALSE), collapse="\n"),
                        '\n\n\n  </div>\n', sep="\n")
    result <- paste0(result,
                    '</div>', sep="\n")
    if (chisq) {
        test <- chisq.test(tab)
        result <- paste0(result,
                        '<p class="chisq-results">X-squared = ', round(test$statistic, 4),
                        ', df = ', test$parameter,
                        ', p = ', format.pval(test$p.value, digits=4),
                        '</p>')
    }
    cat(result)
    
}

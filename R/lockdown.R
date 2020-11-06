#' Convert to an HTML document
#'
#' Format for converting from R Markdown to an HTML document.
#'
#' @details
#' TODO
#'
#' @param ... Additional function arguments passed to R Markdown \code{\link[rmarkdown]{html_document}}
#' @return R Markdown output format to pass to \code{\link[rmarkdown]{render}}
#' @import rmarkdown
#' @importFrom htmltools htmlDependency
#' @importFrom rmarkdown html_document
#' @export


lockdown <- function(...) {

    rmarkdown::html_document(
    ...,
     extra_dependencies = list(
      html_dependency_lockdown()),
      includes = list(
        before_body = system.file("templates/lockdown/header.html", package = "rmdformats")
      )
    )

}

# readthedown js and css
html_dependency_lockdown <- function() {
  htmltools::htmlDependency(name = "lockdown",
                 version = "0.1",
                 src = system.file("templates/lockdown", package = "rmdformats"),
                 script = c("lockdown.js"))
}


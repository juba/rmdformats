#' Convert to an HTML document
#'
#' Format for converting from R Markdown to an HTML document.
#'
#' @param fig_width Default width (in inches) for figures
#' @param fig_height Default width (in inches) for figures
#' @param fig_caption \code{TRUE} to render figures with captions
#' @param highlight Syntax highlighting style. Supported styles include
#'   "default", "tango", "pygments", "kate", "monochrome", "espresso",
#'   "zenburn", "haddock", and "textmate". Pass \code{NULL} to prevent syntax
#'   highlighting.
#' @param ... Additional function arguments passed to R Markdown \code{\link{html_document}}
#'
#' @return R Markdown output format to pass to \code{\link{render}}
#'
#' @examples
#' \dontrun{
#'
#' library(rmdformats)
#'
#' render("input.Rmd", html_docco())
#' 
#' }
#'
#' @export
#' @import rmarkdown
#' @import htmltools

html_docco <- function(fig_width = 6,
                       fig_height = 6,
                       fig_caption = TRUE,
                       highlight = "pygments",
                       ...) {
  
  ## js and css dependencies
  extra_dependencies <- list(rmarkdown:::html_dependency_jquery(),
                             rmarkdown:::html_dependency_bootstrap("bootstrap"),
                             html_dependency_magnific_popup(),
                             html_dependency_docco())
  
  rmarkdown::html_document(
    template=system.file("templates/html_docco/default.html", package="rmdformats"),
    extra_dependencies = extra_dependencies,
    fig_width = fig_width,
    fig_height = fig_height,
    fig_caption = fig_caption,
    highlight = highlight,
    ...
  )
  
}


# create an html dependency for Maginfic popup
html_dependency_magnific_popup <- function() {
  htmltools::htmlDependency(name = "magnific-popup",
                 version = "0.9.9",
                 src = system.file("templates/magnific-popup-0.9.9", package="rmdformats"),
                 script = "jquery.magnific-popup.min.js",
                 stylesheet = "magnific-popup.css")
}

# html_docco js and css
html_dependency_docco <- function() {
  htmltools::htmlDependency(name = "docco",
                 version = "0.1",
                 src = system.file("templates/html_docco", package="rmdformats"),
                 script = "docco.js",
                 stylesheet = "docco.css")
}

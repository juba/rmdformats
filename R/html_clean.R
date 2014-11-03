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
#' render("input.Rmd", html_clean())
#' 
#' }
#'
#' @export
#' @import rmarkdown
#' @import htmltools


html_clean <- function(fig_width = 6,
                       fig_height = 6,
                       fig_caption = TRUE,
                       highlight = "pygments",
                       ...) {
 
  ## js and css dependencies
  extra_dependencies <- list(rmarkdown:::html_dependency_jquery(),
                             rmarkdown:::html_dependency_bootstrap("bootstrap"),
                             html_dependency_jquery_ui(),
                             html_dependency_tocify(),
                             html_dependency_magnific_popup(),
                             html_dependency_clean())
  
  rmarkdown::html_document(
      template=system.file("templates/html_clean/default.html", package="rmdformats"),
      extra_dependencies = extra_dependencies,
      fig_width = fig_width,
      fig_height = fig_height,
      fig_caption = fig_caption,
      highlight = highlight,
      ...
    )
      
}

# create an html dependency for jquery-ui
html_dependency_jquery_ui <- function() {
  htmltools::htmlDependency(name = "jquery-ui",
                 version = "1.10.4",
                 src = system.file("templates/jquery-ui-1.10.4", package="rmdformats"),
                 script = "jquery-ui-1.10.4.custom.min.js")
}

# create an html dependency for tocify
html_dependency_tocify <- function() {
  htmltools::htmlDependency(name = "tocify",
                 version = "1.9.0",
                 src = system.file("templates/tocify-1.9.0", package="rmdformats"),
                 script = "jquery.tocify.min.js")
}

# create an html dependency for Maginfic popup
html_dependency_magnific_popup <- function() {
  htmltools::htmlDependency(name = "magnific-popup",
                 version = "0.9.9",
                 src = system.file("templates/magnific-popup-0.9.9", package="rmdformats"),
                 script = "jquery.magnific-popup.min.js",
                 stylesheet = "magnific-popup.css")
}

# html_clean js and css
html_dependency_clean <- function() {
  htmltools::htmlDependency(name = "clean",
                 version = "0.1",
                 src = system.file("templates/html_clean", package="rmdformats"),
                 script = "clean.js",
                 stylesheet = "clean.css")
}

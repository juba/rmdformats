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
#' @param pandoc_args arguments passed to the pandoc_args argument of rmarkdown \code{\link{html_document}}
#' @param ... Additional function arguments passed to R Markdown \code{\link{html_document}}
#' @return R Markdown output format to pass to \code{\link{render}}
#' @import rmarkdown
#' @importFrom htmltools htmlDependency
#' @export


readthedown <- function(fig_width = 8,
                       fig_height = 5,
                       fig_caption = TRUE,
                       highlight = "kate",
                       pandoc_args = NULL,
                       ...) {
 
  ## js and css dependencies
  extra_dependencies <- list(html_dependency_jquery(),
                             html_dependency_bootstrap(),
                             #html_dependency_jquery_stickytableheaders(),
                             html_dependency_readthedown())
  
  ## Force mathjax arguments
  pandoc_args <- c(pandoc_args, 
                   "--mathjax", 
                   "--variable", paste0("mathjax-url:", default_mathjax()))
  
  rmarkdown::html_document(
      template = system.file("templates/readthedown/default.html", package = "rmdformats"),
      extra_dependencies = extra_dependencies,
      fig_width = fig_width,
      fig_height = fig_height,
      fig_caption = fig_caption,
      highlight = highlight,
      pandoc_args = pandoc_args,
      toc = TRUE,
      toc_depth = 2,
      ...
    )
      
}

# readthedown js and css
html_dependency_readthedown <- function() {
  htmltools::htmlDependency(name = "readthedown",
                 version = "0.1",
                 src = system.file("templates/readthedown", package = "rmdformats"),
                 script = "readthedown.js",
                 stylesheet = c("readthedown.css"))
}



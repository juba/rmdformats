#' Material design - bootstrap HTML output format
#'
#' Format for converting from R Markdown to an HTML document with a material design theme.
#'
#' @details
#' JavaScript and CSS taken and adapted from the Material design theme
#' for Bootstrap 3 project : \url{https://github.com/FezVrasta/bootstrap-material-design}.
#'
#' @param fig_width Default width (in inches) for figures
#' @param fig_height Default width (in inches) for figures
#' @param fig_caption \code{TRUE} to render figures with captions
#' @param highlight Syntax highlighting style. Supported styles include
#'   "default", "tango", "pygments", "kate", "monochrome", "espresso",
#'   "zenburn", "haddock", and "textmate". Pass \code{NULL} to prevent syntax
#'   highlighting.
#' @param lightbox if TRUE, add lightbox effect to content images
#' @param thumbnails if TRUE display content images as thumbnails
#' @param gallery if TRUE and lightbox is TRUE, add a gallery navigation between images in lightbox display
#' @param pandoc_args arguments passed to the pandoc_args argument of rmarkdown \code{\link[rmarkdown]{html_document}}
#' @param use_bookdown if TRUE, uses \code{\link[bookdown]{html_document2}} instead of \code{\link[rmarkdown]{html_document}}, thus providing numbered sections and cross references
#' @param ... Additional function arguments passed to R Markdown \code{\link[rmarkdown]{html_document}}
#' @return R Markdown output format to pass to \code{\link[rmarkdown]{render}}
#' @import rmarkdown
#' @import bookdown
#' @importFrom htmltools htmlDependency
#' @export


material <- function(fig_width = 6,
                       fig_height = 6,
                       fig_caption = TRUE,
                       highlight = "kate",
                       lightbox = TRUE,
                       thumbnails = TRUE,
                       gallery = FALSE,
                       pandoc_args = NULL,
                       use_bookdown = FALSE,
                       ...) {

  ## js and css dependencies
  extra_dependencies <- list(rmarkdown::html_dependency_jquery(),
                             rmarkdown::html_dependency_jqueryui(),
                             html_dependency_bootstrap("bootstrap"),
                             html_dependency_magnific_popup(),
                             html_dependency_bootstrap_material(),
                             html_dependency_material())

  ## Force mathjax arguments
  pandoc_args <- c(pandoc_args,
                   "--mathjax",
                   "--variable", paste0("mathjax-url:", default_mathjax()))
  if (lightbox) { pandoc_args <- c(pandoc_args, "--variable", "lightbox:true") }
  if (thumbnails) { pandoc_args <- c(pandoc_args, "--variable", "thumbnails:true") }
  if (gallery) {
    pandoc_args <- c(pandoc_args, "--variable", "gallery:true")
  } else {
    pandoc_args <- c(pandoc_args, "--variable", "gallery:false")
  }

  ## Merge "extra_dependencies"
  extra_args <- list(...)
  if ("extra_dependencies" %in% names(extra_args)) {
    extra_dependencies <- append(extra_dependencies, extra_args[["extra_dependencies"]])
    extra_args[["extra_dependencies"]] <- NULL
    extra_args[["mathjax"]] <- NULL
  }

  ## Call rmarkdown::html_document
  html_document_args <- list(
    template = system.file("templates/material/material.html", package = "rmdformats"),
    extra_dependencies = extra_dependencies,
    fig_width = fig_width,
    fig_height = fig_height,
    fig_caption = fig_caption,
    highlight = highlight,
    pandoc_args = pandoc_args,
    toc = TRUE,
    toc_depth = 1
  )
  html_document_args <- append(html_document_args, extra_args)
  if (use_bookdown) {
      html_document_func <- bookdown::html_document2
  } else {
      html_document_func <- rmarkdown::html_document
  }

  do.call(html_document_func, html_document_args)

}

# bootstrap material design js and css
# https://github.com/FezVrasta/bootstrap-material-design
html_dependency_bootstrap_material <- function() {
  htmltools::htmlDependency(name = "bootstrap_material",
                 version = "0.1",
                 src = system.file("templates/material/lib", package = "rmdformats"),
                 script = c("material.min.js", "ripples.min.js"),
                 stylesheet = c("bootstrap-material-design.min.css", "ripples.min.css"))
}


# material js and css
html_dependency_material <- function() {
  htmltools::htmlDependency(name = "material",
                 version = "0.1",
                 src = system.file("templates/material", package = "rmdformats"),
                 script = "material.js",
                 stylesheet = "material.css")
}

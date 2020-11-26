#' Convert to an HTML document
#'
#' Format for converting from R Markdown to an HTML document.
#'
#' @details
#' The CSS is heavily inspired from the default one of the docco project :
#' \url{https://ashkenas.com/docco/}.
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
#' @param md_extensions arguments passed to the md_extensions argument of rmarkdown \code{\link[rmarkdown]{html_document}}
#' @param use_bookdown if TRUE, uses \code{\link[bookdown]{html_document2}} instead of \code{\link[rmarkdown]{html_document}}, thus providing numbered sections and cross references
#' @param mathjax set to NULL to disable Mathjax insertion
#' @param ... Additional function arguments passed to rmarkdown \code{\link[rmarkdown]{html_document}}
#' @return R Markdown output format to pass to \code{\link[rmarkdown]{render}}
#' @import rmarkdown
#' @import bookdown
#' @importFrom htmltools htmlDependency
#' @export

html_docco <- function(fig_width = 6,
                       fig_height = 6,
                       fig_caption = TRUE,
                       highlight = "kate",
                       lightbox = TRUE,
                       thumbnails = TRUE,
                       gallery = FALSE,
                       use_bookdown = FALSE,
                       pandoc_args = NULL,
                       md_extensions = NULL,
                       mathjax = "rmdformats",
                       ...) {

    html_template(
        template_name = "html_docco",
        template_path = "templates/template.html",
        template_dependencies = list(
            html_dependency_docco()
        ),
        pandoc_args = pandoc_args,
        fig_width = fig_width,
        fig_height = fig_height,
        fig_caption = fig_caption,
        highlight = highlight,
        lightbox = lightbox,
        thumbnails = thumbnails,
        gallery = gallery,
        use_bookdown = use_bookdown,
        md_extensions = md_extensions,
        mathjax = mathjax,
        ...
    )
    
}


# html_docco js and css
html_dependency_docco <- function() {
  htmltools::htmlDependency(name = "docco",
                 version = "0.1",
                 src = system.file("templates/html_docco", package = "rmdformats"),
                 script = "docco.js",
                 stylesheet = "docco.css")
}

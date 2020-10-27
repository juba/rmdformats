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
#' @param cards if TRUE, sections will be presented as distinct and animated cards
#' @param pandoc_args arguments passed to the pandoc_args argument of rmarkdown \code{\link[rmarkdown]{html_document}}
#' @param md_extensions arguments passed to the md_extensions argument of rmarkdown \code{\link[rmarkdown]{html_document}}
#' @param use_bookdown if TRUE, uses \code{\link[bookdown]{html_document2}} instead of \code{\link[rmarkdown]{html_document}}, thus providing numbered sections and cross references
#' @param mathjax set to NULL to disable Mathjax insertion
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
                     cards = TRUE,
                     use_bookdown = FALSE,
                     pandoc_args = NULL,
                     md_extensions = NULL,
                     mathjax = "rmdformats",
                     ...) {
    html_template(
        template_name = "material",
        template_path = "templates/material/material.html",
        template_dependencies = list(
            html_dependency_bootstrap_material(),
            html_dependency_material()
        ),
        pandoc_args = pandoc_args,
        fig_width = fig_width,
        fig_height = fig_height,
        fig_caption = fig_caption,
        highlight = highlight,
        lightbox = lightbox,
        thumbnails = thumbnails,
        gallery = gallery,
        cards = cards,
        toc = TRUE,
        toc_depth = 1,
        use_bookdown = use_bookdown,
        md_extensions = md_extensions,
        mathjax = mathjax,
        ...
    )

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

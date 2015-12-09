#' Create a new directory with a clean RMarkdown file
#'
#' This function creates a new subdirectory inside the current directory, which will
#' contain a ready-to-use RMarkdown file to be rendered in the given format.
#'
#' @param dirname name of the directory to create
#' @param format R Markdown format to use
#' @param report indicates if the new document is living in the \code{report}
#' @param makefile indicates if a `Makefile` for HTML and PDF rendering should
#' be created in the document folder
#' @details
#' For now on, the available formats are "html_clean", "html_docco".
#' 
#' If \code{report} is TRUE, then a small snippet of code is added at the
#' beginning of the Rmd file. This code allows to switch to the project root
#' before running \code{load.project} when using the included Makefile.
#' @return
#' No value is returned.
#' @author Julien Barnier <julien.barnier@@ens-lyon.fr>
#' This function is heavily inspired and copied from the \link[ProjectTemplate]{create.project} function
#' of the \code{ProjectTemplate} package.
#' @examples
#' \dontrun{
#' create.doc("MyDocument", format="html_clean")
#' }
#' @export

create.doc <- function(dirname="new-doc", format="html_clean", report=FALSE, makefile=TRUE) {
    formats <- c("html_clean", "html_docco")
    format <- match.arg(format, formats)
    tmp.dir <- paste(dirname, "_tmp", sep = "")
    if (file.exists(dirname) || file.exists(tmp.dir)) {
        stop(paste("Cannot run create.doc() from a directory containing", 
                   dirname, "or", tmp.dir))
    }
    dir.create(tmp.dir)
    template_dir <- ifelse(report, paste0(format, "_projecttemplate"), format)
    file.copy(system.file(file.path("rmarkdown", "templates", template_dir, "skeleton", "skeleton.Rmd"), 
                          package = "rmdformats"), file.path(tmp.dir))
    if (makefile)
        file.copy(system.file(file.path("templates", format, "Makefile"), 
                              package = "rmdformats"), file.path(tmp.dir))
    file.rename(tmp.dir, dirname)
    file.rename(file.path(dirname, "skeleton.Rmd"), file.path(dirname, paste0(dirname, ".Rmd")))
    unlink(tmp.dir, recursive = TRUE)
}


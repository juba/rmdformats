## Shared HTML template function

html_template <- function(
  template_name,
  template_path,
  template_dependencies,
  pandoc_args,
  ...) {

    args <- list(...)
    ## For compatibility with pkgdown
    args$template <- NULL

    code_folding <- args[["code_folding"]]
    code_folding <- ifelse(is.null(code_folding), "none", code_folding)
    code_download <- args[["code_download"]]
    code_download <- ifelse(is.null(code_download), FALSE, code_download)
    code_menu <- !identical(code_folding, "none") || code_download

    ## js and css dependencies
    extra_dependencies <- c(
        list(
            rmarkdown::html_dependency_jquery(),
            rmarkdown::html_dependency_jqueryui(),
            html_dependency_navigation(
                code_menu = code_menu,
                source_embed = code_download
            ),
            html_dependency_bootstrap("bootstrap"),
            html_dependency_magnific_popup()
        ),
        template_dependencies
    )
    ## Merge "extra_dependencies"
    if ("extra_dependencies" %in% names(args)) {
        extra_dependencies <- append(extra_dependencies, args[["extra_dependencies"]])
        args[["extra_dependencies"]] <- NULL
        args[["mathjax"]] <- NULL
    }

    ## Force mathjax arguments
    if (!is.null(args[["mathjax"]])) {
        pandoc_args <- c(pandoc_args,
                         "--mathjax",
                         "--variable", paste0("mathjax-url:", default_mathjax()))
    }
    ## Other arguments
    pandoc_args <- c(pandoc_args,
                     "--variable", paste0(template_name, ":true"))
    if (args[["lightbox"]]) {
        pandoc_args <- c(pandoc_args, "--variable", "lightbox:true")
    }
    if (args[["thumbnails"]]) {
        pandoc_args <- c(pandoc_args, "--variable", "thumbnails:true")
    }
    if (args[["gallery"]]) {
        pandoc_args <- c(pandoc_args, "--variable", "gallery:true")
    } else {
        pandoc_args <- c(pandoc_args, "--variable", "gallery:false")
    }
    if (!is.null(args[["cards"]])) {
        if (args[["cards"]]) {
            pandoc_args <- c(pandoc_args, "--variable", "cards:true")
        }
    }


    ## Call rmarkdown::html_document
    html_document_args <- list(
        template = system.file(template_path, package = "rmdformats"),
        extra_dependencies = extra_dependencies,
        pandoc_args = pandoc_args
    )
    html_document_args <- append(html_document_args, args)
    if (args[["use_bookdown"]]) {
        html_document_func <- bookdown::html_document2
    } else {
        html_document_func <- rmarkdown::html_document
    }

    do.call(html_document_func, html_document_args)

}


# create an html dependency for Magnific popup
html_dependency_magnific_popup <- function() {
  htmltools::htmlDependency(name = "magnific-popup",
                            version = "0.9.9",
                            src = system.file("templates/magnific-popup-0.9.9", package = "rmdformats"),
                            script = "jquery.magnific-popup.min.js",
                            stylesheet = "magnific-popup.css")
}


# create an html dependency for jquery-ui
html_dependency_jquery_ui <- function() {
  htmltools::htmlDependency(name = "jquery-ui",
                            version = "1.10.4",
                            src = system.file("templates/jquery-ui-1.10.4", package = "rmdformats"),
                            script = "jquery-ui-1.10.4.custom.min.js")
}

# create an html dependency for tocify
html_dependency_tocify <- function() {
  htmltools::htmlDependency(name = "tocify",
                            version = "1.9.0",
                            src = system.file("templates/tocify-1.9.0", package = "rmdformats"),
                            script = "jquery.tocify.min.js")
}

# create an html dependency for embedded jquery (function copied from rmarkdown)
html_dependency_jquery <- function()  {
  htmltools::htmlDependency(name = "jquery",
                 version = "1.11.0",
                 src = system.file("templates/jquery-1.11.0", package = "rmdformats"),
                 script = "jquery.min.js")
}

# create an html dependency for jquery-stickytableheaders
html_dependency_jquery_stickytableheaders <- function()  {
  htmltools::htmlDependency(name = "jquery-stickytableheaders",
                            version = "0.1.11",
                            src = system.file("templates/jquery-stickytableheaders-0.1.11", package = "rmdformats"),
                            script = "jquery.stickytableheaders.min.js")
}


# create an html dependency for bootstrap (function copied from rmarkdown)
html_dependency_bootstrap <- function(theme = "bootstrap") {
  htmltools::htmlDependency(name = "bootstrap",
                 version = "3.3.6",
                 src = system.file("templates/bootstrap-3.3.6", package = "rmdformats"),
                 meta = list(viewport = "width=device-width, initial-scale=1"),
                 script = c(
                   "js/bootstrap.min.js"
                   # These shims are necessary for IE 8 compatibility
                   #"shim/html5shiv.min.js",
                   #"shim/respond.min.js"
                 ),
                 stylesheet = paste("css/", theme, ".min.css", sep = ""))
}

# create an html dependency for bootstrap js only (function copied from rmarkdown)
html_dependency_bootstrap_js <- function() {
  htmltools::htmlDependency(name = "bootstrap_js",
                            version = "3.3.6",
                            src = system.file("templates/bootstrap-3.3.6", package = "rmdformats"),
                            meta = list(viewport = "width=device-width, initial-scale=1"),
                            script = c(
                              "js/bootstrap.min.js"
                            ))
}

# Mathjax (function copied from rmarkdown)
default_mathjax <- function() {
  "https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"
}


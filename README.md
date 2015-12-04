# rmdformats

[![Travis-CI Build Status](https://travis-ci.org/juba/rmdformats.svg?branch=master)](https://travis-ci.org/juba/rmdformats)
<!-- [![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/rmdformats)](http://cran.r-project.org/package=rmdformats) -->


This R package provides ready-to-use HTML output formats and templates for
RMarkdown documents. The goal is to produce clean documents "out of the box",
with or without the RStudio IDE.

## Formats

The package provides two HTML output formats. You can click on an image to see a real HTML output sample.

### `html_clean` format 

[![](resources/screenshots/html_clean.png)](https://cdn.rawgit.com/juba/rmdformats/master/resources/examples/html_clean/html_clean_sample.html)



### `html_docco` format 

[![](resources/screenshots/html_docco.png)](https://cdn.rawgit.com/juba/rmdformats/master/resources/examples/html_docco/html_docco_sample.html)



## Features and helpers

Some extra features are available depending on the format :

- both formats provide automatic thumbnails for figures with lightbox display
- `html_clean` provides an automatic and dynamic javascript table of contents

The package also provides a `create.doc()` function as well as RStudio document
templates to easily generate an empty and ready to use rmarkdown file with
several configuration directives.

Finally, it also provides the `pilltabs()` helper function, which allows to display a crosstab dynamically. See [one of the output samples](https://cdn.rawgit.com/juba/rmdformats/master/resources/examples/html_clean/html_clean_sample.html#Table) for a live example.


## Installation

The package is not available on CRAN yet, but it is installable from Github :

```r
install.packages(devtools)  # if necessary
devtools::install_github("juba/rmdformats")
```

## Creating a new document

### Within RStudio

Choose `File` > `New File...` > `R Markdown...`, then select `From Template`.
You should then be able to create a new document from one of the package
templates.

### Without RStudio

The `create.doc()` function allows you to create a new directory with a clean
ready-to-use RMarkdown file. `create.doc()` gets two main arguments :

- `dirname` is the name of the folder and RMarkdown file to be created
- `format` is the format name (`"html_clean"` or `"html_docco"`)

By default, a `Makefile` file will be created in the new folder for direct
rendering from the command line.

## Rendering

### With RStudio

Rendering from within RStudio should be quite simple : just click the `Knit` button.

### Rendering from R

You can render your document into HTML directly from within R with the
`render()` function from the `rmarkdown` package :

```r
library(rmarkdown)
render("mydocument.Rmd")
```

### Rendering with the Makefile

If you created your `.Rmd` file with the `create.doc()` function, you can then
generate HTML or PDF files with :

```    
make html
make pdf
```

You can also clean out any generated files and cache with :

```
make clean
```


## Credits

- [Tocify](http://gregfranko.com/jquery.tocify.js/) for the dynamic javascript table of contents
- [Magnific popup](http://dimsemenov.com/plugins/magnific-popup/) lightbox plugin
- The code of `create.doc()` is heavily inspired by the `create.project()` function of the [ProjectTemplate package](http://projecttemplate.net/)
- The CSS for the `html_docco` format is heavily inspired from the default one of the [docco](https://jashkenas.github.io/docco/) project.

The `html_clean` styling and features are very similar to the ones from the great
[knitrBootstrap package](https://github.com/jimhester/knitrBootstrap) by Jim
Hester.

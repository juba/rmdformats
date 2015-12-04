FILE    = `basename *.Rmd .Rmd`

RMDFILE = $(FILE).Rmd
MDFILE  = $(FILE).md
PDFFILE = $(FILE).pdf
HTMLFILE = $(FILE).html
TEXFILE = $(FILE).tex
CACHEDIR = $(FILE)_cache
FILESDIR = $(FILE)_files



all : default

default : 
	Rscript \
	   -e "library(rmarkdown)"  \
	   -e "library(rmdformats)"  \
	   -e "render('$(RMDFILE)')"

html : 
	Rscript \
	   -e "library(rmarkdown)"  \
	   -e "library(rmdformats)"  \
	   -e "render('$(RMDFILE)', 'html_clean')"

pdf : 
	Rscript \
	   -e "library(rmarkdown)" \
           -e "render('$(RMDFILE)', 'pdf_document')"

clean :
	if [ -d $(CACHEDIR) ]; then  rm -rf $(CACHEDIR); fi
	if [ -d $(FILESDIR) ]; then  rm -rf $(FILESDIR); fi
	if [ -e $(MDFILE) ]; then rm $(MDFILE); fi
	if [ -e $(PDFFILE) ]; then rm $(PDFFILE); fi
	if [ -e $(HTMLFILE) ]; then rm $(HTMLFILE); fi
	if [ -e $(TEXFILE) ]; then rm $(TEXFILE); fi		



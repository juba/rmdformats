FILE    := `basename *.Rmd .Rmd`

RMDFILE := $(FILE).Rmd
MDFILE  := $(FILE).md
PDFFILE := $(FILE).pdf
HTMLFILE := $(FILE).html
TEXFILE := $(FILE).tex


all : html

html : 
	Rscript \
	   -e "library(rmarkdown)"  \
	   -e "library(rmdclean)"  \
	   -e "render('$(RMDFILE)', 'html_clean')"

pdf : 
	Rscript \
	   -e "library(rmarkdown)" \
           -e "render('$(RMDFILE)', 'pdf_document')"

clean :
	if [ -d cache ]; then  rm -rf cache/; fi
	if [ -d out ]; then  rm -rf out/; fi
	if [ -e $(MDFILE) ]; then rm $(MDFILE); fi
	if [ -e $(PDFFILE) ]; then rm $(PDFFILE); fi
	if [ -e $(HTMLFILE) ]; then rm $(HTMLFILE); fi
	if [ -e $(TEXFILE) ]; then rm $(TEXFILE); fi		



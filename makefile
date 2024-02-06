## What extension (e.g. md, markdown, mdown) is being used
## for markdown files
MEXT = md

## Expands to a list of all .md files in the working directory
SRC = $(wildcard *.$(MEXT))

## x.html depends on x.md
HTMLS=$(SRC:.md=.html)

## Pandoc arguments, currently only one for citeproc citations
PANDOC_ARGS=--template=pandoc_template

## Rule -- make html
html:		$(HTMLS)

%.html:		%.md
		pandoc  $< -o $@ \
		$(PANDOC_ARGS)
		mv $@ ~/Dropbox/code/website/robertmatyasi\.github\.io/
		open ~/Dropbox/code/website/robertmatyasi\.github\.io/$@

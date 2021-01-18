all:
	TEXINPUTS="../classes:" pdflatex ./index.tex
	# TEXINPUTS="../classes:" BSTINPUTS="../../bibliography:" bibtex index
	TEXINPUTS="../classes:" pdflatex ./index.tex
	TEXINPUTS="../classes:" pdflatex ./index.tex

clean:
	rm -rf auto _region_* *.log *.prv *.aux *.bbl *.blg *.pdf *.dvi *.out *.Backup* *~ *.html *.odt *.rtf *.fmt *.bcf blx.bib *.bst

view:
	xdg-open ./index.pdf

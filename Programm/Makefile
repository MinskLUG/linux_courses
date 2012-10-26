TEXFILES=programm.tex


%.dvi: %.tex $(TEXFILES)
	latex $<
	latex $<
	latex $<

%.ps: %.dvi
	dvips -j0 -Ppdf -o $@ $<

%.pdf: %.ps
	ps2pdf $<


all: programm.pdf

bib: programm.aux
	bibtex8 -s programm.aux


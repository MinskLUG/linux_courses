TARGET=01-intro.pdf


%.dvi: %.tex
	latex $<
	latex $<
	latex $<

%.ps: %.dvi
	dvips -j0 -Ppdf -o $@ $<

%.pdf: %.ps
	ps2pdf $<


all:  $(TARGET)

bib: programm.aux
	bibtex8 -s programm.aux


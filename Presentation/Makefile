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

clean: 
	rm -f *.aux
	rm -f *.vrb
	rm -f *.snm
	rm -f *.log
	rm -f *.out
	rm -f *.toc
	rm -f *.nav

bib: programm.aux
	bibtex8 -s programm.aux


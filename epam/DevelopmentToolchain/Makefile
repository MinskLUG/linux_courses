TARGET  = 01-gcc_intro.pdf
TARGET += 02-linker_intro.pdf
TARGET += 03-elf.pdf

#TARGET += epam-Linux_courses_handbook.pdf

.PHONY: all tex clean 

all: tex

%.pdf: %.tex common.tex
	pdflatex -interaction=nonstopmode $<
	pdflatex -interaction=nonstopmode $<
	pdflatex -interaction=nonstopmode $<

tex: $(TARGET)

bib: programm.aux
	bibtex8 -s programm.aux

clean: 
	@rm -f *.aux
	@rm -f *.vrb
	@rm -f *.snm
	@rm -f *.log
	@rm -f *.out
	@rm -f *.toc
	@rm -f *.nav
	@rm -f $(TARGET)

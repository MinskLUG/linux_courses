TARGET  = 01-gcc_intro.pdf
TARGET += 02-linker_intro.pdf
TARGET += 03-make.pdf
TARGET += 04-elf.pdf
TARGET += 05-debug.pdf
TARGET += 06-debug.pdf
TARGET += 07-valgrind.pdf
TARGET += 08-profile.pdf
TARGET += 09-gcov.pdf
TARGET += 10-doxygen.pdf
TARGET += 12-packaging.pdf

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

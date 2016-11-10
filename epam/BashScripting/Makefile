TARGET = 01-bash_intro.pdf
TARGET += 02-bash_syntax.pdf
TARGET += 03-bash_syntax.pdf
TARGET += 04-bash_syntax.pdf
TARGET += 05-bash_advanced.pdf
TARGET += 06-bash_advanced.pdf

.PHONY: all tex clean

all: tex

%.pdf: %.tex
	pdflatex -interaction=nonstopmode $<
	pdflatex -interaction=nonstopmode $<
	pdflatex -interaction=nonstopmode $<

tex: $(TARGET)

clean: 
	@rm -f *.aux
	@rm -f *.vrb
	@rm -f *.snm
	@rm -f *.log
	@rm -f *.out
	@rm -f *.toc
	@rm -f *.nav
	@rm -f $(TARGET)

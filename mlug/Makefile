%.md: %.tex
	pandoc $< -o $@

%.pdf: %.tex
	pdflatex -interaction=nonstopmode $<
	pdflatex -interaction=nonstopmode $<
	pdflatex -interaction=nonstopmode $<

all: programm.pdf programm.md


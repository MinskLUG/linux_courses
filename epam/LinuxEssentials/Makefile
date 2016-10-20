TARGET = 01-intro.pdf
TARGET += 02-command_line_intro.pdf
TARGET += 03-bash_and_process.pdf
TARGET += 04-commands.pdf
TARGET += 05-rpm.pdf
TARGET += 06-users.pdf
TARGET += 07-networking.pdf
TARGET += 08-disk.pdf

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

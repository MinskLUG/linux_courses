TARGET = 01-intro.pdf
TARGET += 02-command_line_intro.pdf
TARGET += 03-bash_and_process.pdf
TARGET += 04-commands.pdf
TARGET += 05-rpm.pdf
TARGET += 06-users.pdf
TARGET += 07-disk.pdf
TARGET += 08-1-networking.pdf
TARGET += 08-2-networking.pdf

.PHONY: all tex clean

all: $(TARGET)

%.pdf: %.tex
	pdflatex -interaction=nonstopmode $<
	pdflatex -interaction=nonstopmode $<
	pdflatex -interaction=nonstopmode $<

.PHONY: clean .FORCE

$(TARGET): .FORCE

clean: 
	@rm -f *.aux
	@rm -f *.vrb
	@rm -f *.snm
	@rm -f *.log
	@rm -f *.out
	@rm -f *.toc
	@rm -f *.nav
	@rm -f $(TARGET)

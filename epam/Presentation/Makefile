TARGET  = 01-intro.pdf
TARGET += 02-command.pdf
TARGET += 03-users.pdf
TARGET += 04-disk.pdf
TARGET += 05-packages.pdf
TARGET += 06-network.pdf
TARGET += 07-bash_intro.pdf
TARGET += 08-bash_syntax.pdf
TARGET += 09-bash_syntax.pdf
TARGET += 10-bash_syntax.pdf
TARGET += 11-bash_variables_advanced.pdf
TARGET += 12-toolchain_intro.pdf
TARGET += 13-make.pdf
TARGET += 14-autotools_and_doxygen.pdf
TARGET += 15-elf.pdf
TARGET += 16-debug.pdf
TARGET += 17-debug.pdf
TARGET += 18-profile.pdf
TARGET += 19-packaging.pdf
TARGET += 20-version_control.pdf


%.dvi: %.tex
	latex $<
	latex $<
	latex $<

%.ps: %.dvi
	dvips -j0 -Ppdf -o $@ $<

%.pdf: %.tex
	pdflatex $<


all:  $(TARGET)

clean: 
	@rm -f *.aux
	@rm -f *.vrb
	@rm -f *.snm
	@rm -f *.log
	@rm -f *.out
	@rm -f *.toc
	@rm -f *.nav
	@rm -f $(TARGET)

bib: programm.aux
	bibtex8 -s programm.aux

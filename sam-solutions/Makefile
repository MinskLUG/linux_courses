
HTML=README.html Linux_QA_program.html
PDF= 01_Intro_to_linux.pdf \
     02_Bourne_shell.pdf \
     03_Filesystem_intro.pdf \
     04_Text_processing.pdf \
     05_Filesystem_access_rights.pdf \
     06_Processes.pdf

OUTDIR=out
COMMON=linux-qa-common.tex

all: $(HTML) $(PDF)

%.html: %.md
	markdown $< >$@

-include .depend

%.pdf: %.tex $(OUTDIR) $(COMMON) 
	xelatex -mktex=pk -output-directory=$(OUTDIR) -output-format=pdf $<
	xelatex -mktex=pk -output-directory=$(OUTDIR) -output-format=pdf $<
	cp -v "$(OUTDIR)/$@" .

$(OUTDIR):
	mkdir -pv $(OUTDIR)

clean: 
	rm -rvf $(HTML) $(OUTDIR) .depend

.depend: clipart/*.png samples/* *.tex
	-@rm $@
	for file in clipart/*.png clipart/*.jpg samples/*; \
	do \
	  name=$$file;\
	  echo $$file|grep -q "\.png" && name=`basename $$file .png`; export name;\
	  grep -l "$$name" *.tex| xargs -n 1 -I{} sh -c "echo '`basename {} .tex`.pdf: $$file\n'>>$@";  \
	done

connect:
	xrandr --output LVDS1 --mode 1024x768
	xrandr --output VGA1 --auto

disconnect:
	xrandr --output VGA1 --off
	xrandr --output LVDS1 --auto

